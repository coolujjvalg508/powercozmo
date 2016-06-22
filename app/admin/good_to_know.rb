ActiveAdmin.register GoodToKnow do
  menu parent: 'CMS', :label => 'Good To Know', priority: 3, if: proc{ (current_admin_user.has_permission('cms_read') || current_admin_user.has_permission('cms_write') || current_admin_user.has_permission('cms_delete'))}
  
  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column

  permit_params :question, :answer, :active
  controller do 
    def action_methods
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

    def sort      
      @good_to_know = GoodToKnow.find(params[:id])
      @good_to_know.set_list_position(params[:position].to_i)
      render :json => {message: 'Position updated'}
    end
  end

  action_item :back, only: :show do    
    link_to "Back", collection_path, method: :get
  end

  batch_action "Update 'Active' for", form: { active: %w[Yes No] } do |ids, inputs|
    # inputs is a hash of all the form fields you requested   
    GoodToKnow.where(id: ids).update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end

  # Index Page
  index :download_links => ['csv'] do
    selectable_column
    column 'Question' do |gtk|
      tr_con = gtk.question.first(45)
      link_to tr_con.html_safe, admin_faq_path(gtk)
    end
    column 'Answer' do |gtk|
      tr_con = gtk.answer.first(45)
      tr_con.html_safe
    end
    column "Status" do |status|
      status.try(:active) ? 'Active' : 'Inactive'
    end
    column :created_at
    actions
  end

  csv do
    column 'Question' do |gtk|
      tr_con = gtk.question.first(45)
      strip_tags(tr_con)
    end
    column 'Answer' do |gtk|
      tr_con = gtk.answer.first(45)
      strip_tags(tr_con)
    end
    column "Status" do |status|
      status.try(:active) ? 'Active' : 'Inactive'
    end
    column :created_at
  end

  # New/Edit Form
  form :title => 'New Good To Know' do |f|
    f.inputs "Good To Know" do
      f.input :question, :rows => 15, :cols => 15
      li do
        insert_tag(Arbre::HTML::Label, "Answer") { content_tag(:abbr, "*", title: "required") }
        f.bootsy_area :answer, :rows => 15, :cols => 15, editor_options: { html: true }
      end
      f.input :active
    end
    f.actions
  end  

  # Filters
  filter :question
  filter :answer
  filter :active, as: :select, collection: [['Active',1], ['InActive', 0]], label: "Status"
  filter :created_at
  filter :updated_at

  # Show Page
  show :title => 'Good To Know' do 
    attributes_table do
      row 'Question' do |faq|
        text_node faq.question.html_safe
      end
      row 'Answer' do |faq|
        text_node faq.answer.html_safe
      end      
      row :active
      row :created_at
    end
  end
end