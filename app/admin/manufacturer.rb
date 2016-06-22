ActiveAdmin.register Manufacturer do
	menu label: 'Manufacturers', parent: 'Masters', if: proc{ (current_admin_user.has_permission('manufacturer_read') || current_admin_user.has_permission('manufacturer_write') || current_admin_user.has_permission('manufacturer_delete'))}

	permit_params :name, :status

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
        disallowed << 'index' if (!current_admin_user.has_permission('manufacturer_read') && !current_admin_user.has_permission('manufacturer_write') && !current_admin_user.has_permission('manufacturer_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('manufacturer_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('manufacturer_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('manufacturer_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('manufacturer_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('manufacturer_delete'))
        super - disallowed
      end
    end
  end

  # Users List View
  index :download_links => ['csv'] do
    selectable_column
    column :name
    column :status
		column :created_at
    actions
  end

  # Filters
  filter :name
  filter :status, as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :created_at

  # Show Page
  show do
    attributes_table do
      row :name        
      row :status
      row :created_at
    end
  end

  batch_action "Update 'Status' for", form: { status: [['Active',1],['Inactive',0]] } do |ids, inputs|    
    Manufacturer.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end
