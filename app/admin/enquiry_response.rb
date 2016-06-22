ActiveAdmin.register EnquiryResponse do
	menu false
	actions :all, except: [:index, :new, :create, :destroy, :show]
	permit_params :message

	breadcrumb do
    [
      link_to('Manage Enquiries', admin_equipment_enquiries_path)
    ]
  end

  controller do

  	def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('equipmentenquiry_read') && !current_admin_user.has_permission('equipmentenquiry_write') && !current_admin_user.has_permission('equipmentenquiry_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('equipmentenquiry_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('equipmentenquiry_delete'))
        super - disallowed
      end
    end

    def update    	
      super do |format|
        if resource.valid?
        	resource.update_attributes(status: "forwarded", forwarded_by: current_admin_user.try(:id))
        	redirect_to admin_equipment_enquiry_path(resource.equipment_enquiry_id), notice: 'Seller response is forwarded' and return
        end
      end
    end

  end

  form title: 'Edit Response' do |f|
    f.inputs do    	
      li do
        insert_tag(Arbre::HTML::Label, "Message") { content_tag(:abbr, "*", title: "required") }
        f.bootsy_area :message, :rows => 15, :cols => 15, editor_options: { html: true, image: false }
      end      
    end  	
    f.actions do
    	f.action :submit, :label => "Edit and forward"
    	f.cancel_link(:back)
  	end
  end
end