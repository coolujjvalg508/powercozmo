ActiveAdmin.register Mailboxer::Conversation, as: "SentMessage" do

  menu parent: 'Messages', :label => 'Sent Messages', priority: 2, if: proc{ (current_admin_user.has_permission('message_read') || current_admin_user.has_permission('message_write') || current_admin_user.has_permission('message_delete'))}

	before_filter :find_admin_email_user
	actions :all, except: [:show,:new, :create,:edit, :update]
	permit_params  :recipients, :subject, :body, :attachment

  action_item :new, only: :index do
    if current_admin_user.has_permission('message_write')
      link_to 'New Message', new_admin_message_path, method: :get
    end
  end


	batch_action :destroy do |ids|		
		conversations = @admin_email_user.mailbox.conversations.where(id: ids)		
		conversations.each do |conversation|
			conversation.move_to_trash(@admin_email_user)
		end
		flash[:notice] = "Successfully destroyed #{ids.count} messages"
    redirect_to collection_path
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
       @admin_email_user.mailbox.sentbox.includes(:messages).where('trashed = ? and deleted = ?',false ,false)
      end
  	end

  	def destroy
  		resource = @admin_email_user.mailbox.conversations.find(params[:id])
  		unless resource
				flash[:error] = "Record not found"				
				redirect_to collection_path
			else
				conversation = resource #.conversation
				conversation.move_to_trash(@admin_email_user)
				flash[:alert] = "Message deleted successfully"
		    redirect_to collection_path
			end
  	end
  end

  # Index page
  index title: 'Sent Messages', :download_links => ['csv'] do
    selectable_column
    column 'To' do |conversation|  
      last_message_to(conversation,AdminUser.global_email_admin)
    end
    column :subject
    column 'Date & time', sortable: :updated_at do |conversation|
      message_time_format(conversation.updated_at)
    end
    column 'Attachment' do |conversation|    	
    	has_attachment?(conversation) ? image_tag('attachment-icon.png', alt: "") : ''    	
    end
    # actions
    column "" do |conversation|
     links = ""
     links = link_to I18n.t('active_admin.view'), admin_message_path(conversation), :class => "member_link view_link" if(current_admin_user.has_permission('message_read') || current_admin_user.has_permission('message_write') || current_admin_user.has_permission('message_delete'))     
     links += link_to I18n.t('active_admin.delete'), resource_path(conversation), method: :delete, data: {:confirm => "Are you sure?"}, :class => "member_link delete_link" if current_admin_user.has_permission('message_delete')
     links
    end
  end

  # Filters
  filter :subject    
  filter :created_at
  filter :updated_at
  
end