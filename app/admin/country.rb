ActiveAdmin.register Country do
	menu label: 'Countries', parent: 'Masters', if: proc{ (current_admin_user.has_permission('country_read') || current_admin_user.has_permission('country_write') || current_admin_user.has_permission('country_delete'))}

	permit_params :name, :code, :status

  action_item :back, only: :show do
   link_to "Back", collection_path, method: :get
  end

  controller do 
    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('country_read') && !current_admin_user.has_permission('country_write') && !current_admin_user.has_permission('country_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('country_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('country_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('country_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('country_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('country_delete'))
        super - disallowed
      end
    end
  end


  # Users List View
  index :download_links => ['csv'] do
    selectable_column
    column :name
    column :code
    column :status
		column :created_at
    actions
  end

  # Filters
  filter :name
  filter :code
  filter :status, as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :created_at

  # Show Page
  show do
    attributes_table do
      row :name
      row :code
      row :status
      row :created_at
    end
  end

  batch_action "Update 'Status' for", form: { status: [['Active',1],['Inactive',0]] } do |ids, inputs|    
    Country.active.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end
