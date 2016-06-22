ActiveAdmin.register AdminUser, :as => 'Admin' do
  menu label: 'Admins', parent: 'Users', priority: 2, if: proc{ (current_admin_user.has_permission('admin_read') || current_admin_user.has_permission('admin_write') || current_admin_user.has_permission('admin_delete'))}
  permit_params :email, :password, :password_confirmation, :role, :name, :active, access_control_attributes: [ :id, permissions_hash: [] ]

  action_item :back, only: :show do
   link_to "Back", collection_path, method: :get
  end

  controller do
    def update
      params[:admin_user][:access_control_attributes][:permissions_hash].compact
      if params[:admin_user][:password].blank?
        params[:admin_user].delete("password")
        params[:admin_user].delete("password_confirmation")
      end
      super
    end

    def scoped_collection
      AdminUser.where(role: 'admin')
    end

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('admin_read') && !current_admin_user.has_permission('admin_write') && !current_admin_user.has_permission('admin_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('admin_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('admin_delete'))
        super - disallowed
      end
    end
  end

  index do
    selectable_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :active
    actions
  end

  controller do
    def scoped_collection
      AdminUser.where(role: 'admin')
    end

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('admin_read') && !current_admin_user.has_permission('admin_write') && !current_admin_user.has_permission('admin_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('admin_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('admin_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('admin_delete'))
        super - disallowed
      end
    end

  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :active, as: :select, collection: [['Active',1], ['InActive', 0]], label: 'Status'
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :name
      f.input :role, :as => :hidden, input_html: {value: 'admin'}
      f.input :password
      f.input :password_confirmation
      f.input :active
    end

    f.inputs "Access Control" ,for: [:access_control, f.object.try(:access_control) || AccessControl.new], class: 'access-panel' do |permission|
      @model_names = AdminUser::MODULESTOPERMIT
      @model_names.each do |model|
        key = "permissions_hash"
        if model == 'sitesettings'
          permission.input key, as: :check_boxes, collection: [['read', "#{model}_read"], ['write', "#{model}_write"]], label: model.capitalize
        else
          permission.input key, as: :check_boxes, collection: [['read', "#{model}_read"], ['write', "#{model}_write"], ['delete', "#{model}_delete"]], label: model.capitalize
        end
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :role
      row "Status" do |user|
        user.try(:active) ? 'Active' : 'Inactive'
      end

      row "Access control" do |user|
        if user.try(:access_control).try(:permissions).present?
          permissions = user.try(:access_control).permissions
          array = []
          permissions.each do |key, value|
            vlue = value.split
            vlue.each do |v|
              array << v
            end
            permissions[key] = array
            array= []
          end
          permissions.each do |key, value|
            permissions[key] = value.join(',')
          end
          table :style => 'width:500px;margin:-10px' do
            tr do
              th :style => 'font-weight:bolder' do
                "Modules"
               end
              th :style => 'font-weight:bolder' do
                "Permissions"
               end
            end
            permissions.each do |key, value|
              tr do
                td do
                  key.capitalize
                 end
                td do
                  value.split(',').map!(&:capitalize).join(', ')
                end
              end
            end
          end
        else
        end
      end
    end
  end

  batch_action "Update 'Status' for", form: { active: [['Active',1],['Inactive',0]] } do |ids, inputs|
    AdminUser.where(id: ids).update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end
