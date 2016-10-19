ActiveAdmin.register PageContentManagement do
  config.sort_order = 'updated_at_desc'

  menu parent: 'CMS', priority: 10, if: proc{ (current_admin_user.has_permission('cms_read') || current_admin_user.has_permission('cms_write') || current_admin_user.has_permission('cms_delete'))}

  permit_params :page_url, :page_section, :content, :active, :bootsy_image_gallery_id

  actions :all, except: [:new, :destroy]

  action_item :back, only: :show do
    link_to "Back", admin_page_content_managements_path, method: :get
  end

  controller do 
    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('cms_read') && !current_admin_user.has_permission('cms_write') && !current_admin_user.has_permission('cms_delete'))
        disallowed << 'show' if (!current_admin_user.has_permission('cms_read') && !current_admin_user.has_permission('cms_write') && !current_admin_user.has_permission('cms_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('cms_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('cms_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('cms_delete'))
        super - disallowed
      end
    end
  end


  batch_action "Update status for", form: { active: [['Active',1],['Inactive',0]] } do |ids, inputs|
    page_content = PageContentManagement.where(id: ids)
    page_content.update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end

  # Index
  index :download_links => false do
    selectable_column
    column :page_url
    column :page_section
    column 'Content' do |page|
      ActionView::Base.full_sanitizer.sanitize(page.content.html_safe).gsub(/\n\t\t\s+/, '').first(60)
    end  
    column "Status" do |status|
      status.try(:active) ? 'Active' : 'Inactive'
    end
    actions   
  end

  # New/Edit Form
  form do |f|
    f.inputs "Static Page" do
    	
      f.input :page_url, :label => 'Page Url', :as => :string, :input_html => { :disabled => true } 
      f.input :page_section, :label => 'Page Section', :as => :string, :input_html => { :disabled => true } 
      li do
        insert_tag(Arbre::HTML::Label, "Content", class: "label") { content_tag(:abbr, "*", title: "required") }
        f.bootsy_area :content, :rows => 25, :cols => 25, editor_options: { html: true }
      end
      
      f.input :active
    end
    f.actions
  end

  # Filters
  filter :page_url, :as => :string
  filter :page_section, :as => :string
  filter :active, as: :select, collection: [['Active',1], ['InActive', 0]], label: "Status"

  # Show Page
  show do
    attributes_table do
      row :page_url
      row :page_section
      row 'Content' do |sp|
        text_node sp.content.html_safe
      end
      row :active
      row :created_at
      row :updated_at
    end
  end

end
