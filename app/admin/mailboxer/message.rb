ActiveAdmin.register Mailboxer::Conversation, as: "Message" do

  menu parent: 'Messages', :label => 'Received Messages', priority: 1, if: proc{ (current_admin_user.has_permission('message_read') || current_admin_user.has_permission('message_write') || current_admin_user.has_permission('message_delete'))}

  before_filter :find_admin_email_user
  permit_params  :recipients, :subject, :body, :attachment

  actions :all, except: [:edit, :update]

  action_item :back, only: :show do
    if request.referrer.present?
      link_to "Back", request.referrer
    else      
      link_to "Back", collection_path, method: :get
    end
  end

  form :partial => "form"

	batch_action :destroy do |ids|		
		conversations = @admin_email_user.mailbox.conversations.where(id: ids)		
		conversations.each do |conversation|
			conversation.move_to_trash(@admin_email_user)
		end
		flash[:notice] = "Successfully destroyed #{ids.count} messages"
    redirect_to collection_path
  end

  collection_action :autocomplete, method: :get do
    emails = User.includes(:profile).where("#{Profile.table_name}.first_name LIKE ? OR #{Profile.table_name}.last_name LIKE ? OR #{User.table_name}.email LIKE ?","%#{params[:q].to_s}%","%#{params[:q].to_s}%","%#{params[:q].to_s}%").pluck(:email)
    render json: emails, status: 200
  end

  member_action :reply, method: :post do      
    conversation = @admin_email_user.mailbox.conversations.where(id: params[:id]).first
    if conversation          
      params[:mailboxer_message] ||= {}
      message_params = params[:mailboxer_message]
      message_params[:subject] = conversation.subject
      message_params[:should_untrash] ||= true
      message_params[:sanitize_text] ||= true          
      @admin_email_user.reply_to_conversation(conversation,message_params[:body], message_params[:subject],message_params[:should_untrash],message_params[:sanitize_text], message_params[:attachment])
      flash[:notice] = "Message sent successfully."
      redirect_to admin_message_path(conversation)
    else
      flash[:error] = "Record not found"
      redirect_to collection_path
    end
  end

  controller do
    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('message_read') && !current_admin_user.has_permission('message_write') && !current_admin_user.has_permission('message_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('message_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('message_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('message_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('message_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('message_delete'))
        super - disallowed
      end
    end

    def find_admin_email_user
      @admin_email_user = AdminUser.global_email_admin
      unless @admin_email_user
        flash[:error] = "Admin user not found"        
        redirect_to admin_dashboard_path      
      end
    end
    def scoped_collection
      if ['show','destroy'].include?(params[:action])
        resource_class.unscoped
      else       
        @admin_email_user.mailbox.inbox.includes(:messages).where('trashed = ? and deleted = ?',false ,false)     
      end
    end

    def show     
      resource = @admin_email_user.mailbox.conversations.includes(:messages).find params[:id]     
      @receipt = resource.receipts.inbox.where("receiver_type = ? AND receiver_id = ?",@admin_email_user.class.name , @admin_email_user.id).first if resource
      unless resource
        flash[:error] = "Record not found"        
        redirect_to collection_path     
      end
      resource.mark_as_read(@admin_email_user)
     rescue ActiveRecord::RecordNotFound
        redirect_to collection_path
    end

  	def destroy
  		resource = @admin_email_user.mailbox.conversations.find(params[:id])
  		unless resource
				flash[:error] = "Record not found"				
				redirect_to collection_path
			else
				conversation = resource
				conversation.move_to_trash(@admin_email_user)
				flash[:notice] = "Message deleted successfully"
		    redirect_to collection_path
			end
  	end

    def create
      params[:mailboxer_message] ||= {}
      conversation_params = params[:mailboxer_message]
      recipient_emails = params[:mailboxer_message][:recipients].split(',')
      @recipients = User.where(email: recipient_emails).all     
      conversation_params[:sanitize_text] = true    
      @receipt = @admin_email_user.
          send_message(@recipients,conversation_params[:body], conversation_params[:subject],conversation_params[:sanitize_text], conversation_params[:attachment])
      flash[:notice]= "Message sent successfully"
      if (@receipt.errors.blank?)
        redirect_to admin_message_path(@receipt.conversation)
      else
        redirect_to admin_sent_messages_path
      end
    end

  end

  # Index page  
  index :download_links => ['csv'], row_class: ->elem { 'unread' unless elem.is_read?(AdminUser.global_email_admin) } do
    selectable_column
    column 'From' do |conversation|  
      last_message_from(conversation,AdminUser.global_email_admin)
    end
    column :subject
    column 'Date & time', sortable: :updated_at do |conversation|
      message_time_format(conversation.updated_at)
    end    
    column 'Attachment' do |conversation|      
      has_attachment?(conversation) ? image_tag('attachment-icon.png', alt: "") : ''      
    end
    actions
  end

  # Filters
  filter :subject    
  filter :created_at
  filter :updated_at

  # Show Page  
  show title: 'Message Detail' do |conversation|
    render partial: "conversation", locals: {conversation: conversation}
  end 
end
