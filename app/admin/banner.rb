ActiveAdmin.register Banner do
  menu label: 'Banners', parent: 'CMS', priority: 5, if: proc{ (current_admin_user.has_permission('banner_read') || current_admin_user.has_permission('banner_write') || current_admin_user.has_permission('banner_delete'))}

	permit_params :status, image_attributes: [:id, :image, :imageable_id, :imageable_type]

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
        disallowed << 'index' if (!current_admin_user.has_permission('banner_read') && !current_admin_user.has_permission('banner_write') && !current_admin_user.has_permission('banner_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('banner_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('banner_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('banner_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('banner_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('banner_delete'))
        super - disallowed
      end
    end
  end

	# Users List View
  index :download_links => ['csv'] do
    selectable_column
    column 'Banner' do |banner|
  		image_tag banner.try(:image).try(:image).try(:url, :thumb), height: 50, width: 50
    end
    column :status
		column :created_at
    actions
  end

  controller do
    def new
      @banner = Banner.new
      @banner.build_image
    end

    def create
      unless (params[:banner][:image_attributes].present?)
        @banner = Banner.new
        @banner.build_image
        @banner.errors.add(:image, "can't be blank")
        render 'new'
      else
        super
      end
    end

    def update
      if params[:banner][:status] == "active"
        Banner.update_all(:status => 0)
      end
      super
    end

  end

  # User New/Edit Form
  form multipart: true do |f|
    f.inputs "Banner", for: :image do |img|
      img.input :image, :as => :file, :hint => image_tag(img.object.image.url(:thumb))
      f.semantic_errors *f.object.errors.keys
    end
    f.inputs "" do
      f.input :status
    end
    f.actions
  end

  # Show Page
  show do
    attributes_table do
      row ' ' do |banner|
        image_tag(banner.image.image.url(:carousel))
      end
    end
  end

  # Filters
  filter :status, as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :created_at

  batch_action "Update 'Status' for", form: { status: [['Active',1],['Inactive',0]] } do |ids, inputs|
    if inputs[:status] == 1 || inputs[:status] == "1"
      Banner.update_all(status: 0)
    end
    Banner.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end