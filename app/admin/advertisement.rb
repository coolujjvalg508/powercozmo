ActiveAdmin.register Advertisement do
  menu label: 'Advertisements', parent: 'CMS', priority: 4, if: proc{ (current_admin_user.has_permission('advertisement_read') || current_admin_user.has_permission('advertisement_write') || current_admin_user.has_permission('advertisement_delete'))}
  
	permit_params :title, :active, image_attributes: [:id, :image, :imageable_id, :imageable_type]

  actions :all, except: [:new, :destroy]

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
        disallowed << 'index' if (!current_admin_user.has_permission('advertisement_read') && !current_admin_user.has_permission('advertisement_write') && !current_admin_user.has_permission('advertisement_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('advertisement_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('advertisement_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('advertisement_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('advertisement_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('advertisement_delete'))
        super - disallowed
      end
    end
  end

	# Users List View
  index :download_links => ['csv'] do
    selectable_column
    column :title
    column 'Page Location', :page_reference
    column 'Advertisement Image' do |advertisement|
      image_tag advertisement.try(:image).try(:image).try(:url, :thumb), height: 50, width: 50
    end
    column "Status" do |advertisement|
        advertisement.try(:active) ? 'Active' : 'Inactive'
    end
    actions
  end

  controller do
     def edit
      @advertisement = Advertisement.where(:id => params[:id]).first
      unless @advertisement.image
        @advertisement.build_image
      end
    end
  end

  # User New/Edit Form
  form multipart: true do |f|        
    f.inputs "" do
      f.input :title
      f.input :page_reference, :label => 'Page Location', :as => :string, :input_html => { :disabled => true }
      f.input :active
    end
    f.inputs "Advertisement Image", for: :image do |img|
      img.input :image, :as => :file, :hint => image_tag(img.object.try(:image).try(:thumb).try(:url))
    end
    f.actions
  end

  # Show Page
  show do  
  attributes_table do
      row :title      
      row 'Page Location' do
            advertisement.page_reference
        end
      row 'Advertisement Image' do |advertisement|
        if (advertisement.page_reference == "listing top horizontal" || advertisement.page_reference == "listing details top horizontal")
          image_tag(advertisement.image.try(:image).try(:ad_horizontal).try(:url))
        else
          image_tag(advertisement.image.try(:image).try(:ad_square).try(:url))        
        end
      end 
      row "Status" do |advertisement|
        advertisement.try(:active) ? 'Active' : 'Inactive'
    end    
    end
  end

  # Filters
  filter :title
  filter :active, :label => 'Status', as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :created_at

  batch_action "Update 'Status' for", form: { active: [['Active',1],['Inactive',0]] } do |ids, inputs|
    Advertisement.where(id: ids).update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end
