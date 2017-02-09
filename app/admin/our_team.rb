ActiveAdmin.register OurTeam do
	menu label: 'Our Team', parent: 'CMS', if: proc{ (current_admin_user.has_permission('ourteam_read') || current_admin_user.has_permission('ourteam_write') || current_admin_user.has_permission('ourteam_delete'))}

	permit_params :name, :description, :active, image_attributes: [:id, :image, :imageable_id, :imageable_type]

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
        disallowed << 'index' if (!current_admin_user.has_permission('ourteam_read') && !current_admin_user.has_permission('ourteam_write') && !current_admin_user.has_permission('ourteam_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('ourteam_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('ourteam_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('ourteam_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('ourteam_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('ourteam_delete'))
        super - disallowed
      end
    end
  end
  
  # Users List View
  index :download_links => ['csv'] do
    selectable_column
    column :name
    column :description
    column 'Image' do |img|
      image_tag img.try(:image).try(:image).try(:url, :thumb), height: 50, width: 50
    end  
    column :active
	column :created_at
    actions
  end
  
  controller do
  
	def new
      @our_team = OurTeam.new
      @our_team.build_image          
    end	
		
    def create
        
      unless (params[:our_team][:image_attributes].present?)
        @our_team = OurTeam.new
        @our_team.build_image
        @our_team.errors.add(:image, "can't be blank")
        render 'new'
      else
        super
      end
    end

     def edit
      @our_team = OurTeam.where(:id => params[:id]).first
      unless @our_team.image
        @our_team.build_image
      end
    end
  end
  
  # User New/Edit Form
  form multipart: true do |f|        
    f.inputs "" do
      f.input :name
      f.input :description
      f.input :active
    end
    f.inputs "Image", for: :image do |img|
      img.input :image, :as => :file, :hint => image_tag(img.object.try(:image).try(:thumb).try(:url))
      #img.input :image, :as => :file, :hint => image_tag(img.object.image.url(:thumb))
      #f.semantic_errors *f.object.errors.keys
    end
    f.actions
  end 
  
  # Filters
  filter :name
  filter :description
  filter :active, as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :created_at

  # Show Page
  show do
    attributes_table do
	  row ' ' do |img|
        image_tag(img.image.image.url(:event_small))
      end
      row :name    
      row :description    
      row :active
      row :created_at
    end
  end 

  batch_action "Update 'Status' for", form: { active: [['Active',1],['Inactive',0]] } do |ids, inputs|    
    OurTeam.where(id: ids).update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end
  

end
