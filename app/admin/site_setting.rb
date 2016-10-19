ActiveAdmin.register SiteSetting do
  menu label: 'Settings', parent: 'CMS', if: proc{ (current_admin_user.has_permission('sitesetting_read'))}
  permit_params :copy_right_text, :header_phone, :header_email, :homepage_heading, :homepage_text, :homepage_search_text, :footer_text
  actions :all, except: [:destroy, :new, :create]
  controller do
    def action_methods
        if current_admin_user.role == 'super_admin'
            super
        else
            disallowed = []
            disallowed << 'index' unless (current_admin_user.has_permission('sitesetting_read'))
            disallowed << 'show' unless (current_admin_user.has_permission('sitesetting_read'))
            disallowed << 'delete' unless (current_admin_user.has_permission('sitesetting_delete'))
            disallowed << 'create' unless (current_admin_user.has_permission('sitesetting_write'))
            disallowed << 'new' unless (current_admin_user.has_permission('sitesetting_write'))
            disallowed << 'edit' unless (current_admin_user.has_permission('sitesetting_write'))
            disallowed << 'destroy' unless (current_admin_user.has_permission('sitesetting_delete'))
            super - disallowed
        end
    end
    define_method(:index) do
      redirect_to "/admin/site_settings/#{SiteSetting.last.id}"
    end
  end

  show do
    attributes_table do
      row "Copyright Text" do |setting|
        setting.copy_right_text.html_safe
      end
      row :header_phone
      row :header_email
      row :homepage_heading
      row :homepage_text
      row :homepage_search_text
      row :footer_text
    end
  end

  form do |f|
    f.inputs "Site Setting Details" do
      f.input :copy_right_text
      f.input :header_phone
      f.input :header_email
      f.input :homepage_heading
      f.input :homepage_text
      f.input :homepage_search_text
      f.input :footer_text
    end
    f.actions
  end
end
