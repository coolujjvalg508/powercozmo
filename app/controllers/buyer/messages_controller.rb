# For application naming purpose, created messages coontroller as conversation controller
class Buyer::MessagesController < Buyer::BaseController
	before_filter :authenticate_user!
  helper_method :mailbox, :conversation

  def inbox
    @conversations = mailbox.inbox.includes(:messages).where('trashed = ? and deleted = ?',false ,false).page(params[:page]).per(15)  	
  end

  def sentbox
    @conversations = mailbox.sentbox.includes(:messages).where('trashed = ? and deleted = ?',false ,false).page(params[:page]).per(15)
  end

  def show
  	unless conversation.present?
  		flash[:error] = "Record not found"
  		redirect_to :back
  	end
    @conversation.mark_as_read(current_user)
    @receipt = @conversation.receipts.inbox.where("receiver_type = 'User' AND receiver_id = ?", current_user.id).first if @conversation.present?
		rescue ActionController::RedirectBackError
			flash[:error] = "Record not found"
  		redirect_to buyer_dashboard_path
  end

  def new  	
  end
  
  def create
    # recipient_emails = conversation_params(:recipients).split(',')
    # @recipients = AdminUser.where(email: recipient_emails).all
    @recipients = AdminUser.global_email_admin
    conversation_params[:sanitize_text] = true
		@attachment_size = ((File.size(conversation_params[:attachment].tempfile)).to_f / 2**20).round(2) if conversation_params[:attachment].present?		
    if @recipients.present? && conversation_params[:subject].present? && conversation_params[:body].present? && @attachment_size.to_f <= 32
	    @receipt = current_user.
	      send_message(@recipients, *conversation_params(:body, :subject, :sanitize_text, :attachment))    	
    else
    	if @recipients.present? && @attachment_size.to_f <= 32
	    	@receipt = current_user.
		      send_message([], *conversation_params(:body, :subject, :sanitize_text, :attachment))
    	else    	
    		@receipt = Mailboxer::Receipt.new
    		@receipt.valid?
		  end
    end
    if (@receipt.errors.blank?)
      conversation = @receipt.conversation
      flash[:notice] = "Message sent successfully"
      redirect_to buyer_message_path(conversation)
    else    	
      render :action => :new
    end
  end

  def remove
    if params[:buyer_message_ids].present? && params[:buyer_message_ids].is_a?(Array) && params[:buyer_message_ids].map(&:to_i).length > 0  		
  		conversations = mailbox.conversations.where(id: params[:buyer_message_ids].map(&:to_i).compact.uniq)
  		conversations.each do |conversation|
  			conversation.move_to_trash(current_user)
  		end
  		flash[:notice] = "Successfully destroyed #{params[:buyer_message_ids].map(&:to_i).count} messages"
  	end
  	redirect_to :back
		rescue ActionController::RedirectBackError
  		redirect_to buyer_dashboard_path  	
  end

  def reply  	
  	message_params[:should_untrash] ||= true
  	message_params[:sanitize_text] ||= true
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject, :should_untrash, :sanitize_text, :attachment))
    flash[:notice] = "Message sent successfully"    
    redirect_to buyer_message_path(conversation)    
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to inbox_buyer_messages_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to inbox_buyer_messages_path
  end

  def autocomplete
  	admin_emails = AdminUser.where("name LIKE ? OR email LIKE ?","%#{params[:q].to_s}%","%#{params[:q].to_s}%").pluck(:email)
  	render json: admin_emails, status: 200  	
  end

  def unread    
    @conversations = mailbox.inbox(:read => false).limit(15)
    respond_to do |format|
      format.js
    end
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to buyer_dashboard_path
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
