ActiveAdmin.register Category do
	menu label: 'Categories', parent: 'Masters', if: proc{ (current_admin_user.has_permission('category_read') || current_admin_user.has_permission('category_write') || current_admin_user.has_permission('category_delete'))}

	permit_params :name, :parent_id, :status, :lft, :rgt, :depth, :children_count, image_attributes: [:id, :image, :imageable_id, :imageable_type, :image_cache]

  action_item :back, only: :show do
   link_to "Back", collection_path, method: :get
  end

  scope :active
  scope :inactive

  config.sort_order = 'lft_asc'
  sortable_tree_member_actions

	# Users List View
  index :download_links => ['csv'] do
    selectable_column
    sortable_tree_columns
    column :name
    column :parent do |cat|
      Category.find_by(id: cat.parent_id).try(:name)
    end
    column 'Image' do |user|
      image_tag user.try(:image).try(:image).try(:url, :thumb), height: 50, width: 50
    end
    column :status
		column :children_count do |cat|
      cat.children.count
    end
		column :created_at
    actions
  end

  controller do

    def create
      unless params[:category][:image_attributes][:image].present?
        params[:category][:image_attributes][:image] = params[:category][:image_attributes][:image_cache]
        super
      else
        super
      end
    end

    def update
      unless params[:category][:image_attributes][:image].present?
        params[:category][:image_attributes][:image] = params[:category][:image_attributes][:image_cache]
      else
        params[:category][:image_attributes][:image]
      end
      super
    end

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('category_read') && !current_admin_user.has_permission('category_write') && !current_admin_user.has_permission('category_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('category_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('category_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('category_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('category_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('category_delete'))
        super - disallowed
      end
    end
  end

  # Filters
  filter :name
  filter :parent_id, as: :select, label: 'Parent Category', collection: -> { nested_set_options(Category.active, @category) {|i| "#{' -' * i.level} #{i.name}" } }
  filter :status, as: :select, collection: [['Active',1], ['InActive', 0]]
  filter :depth, as: :select, collection: [['Parent', 0], ['Sub categories', 1], ['sub sub categories', 2]], label: "Categories Level"
  filter :created_at

  # Form
  # User New/Edit Form
  form multipart: true do |f|
    f.inputs "Category" do
      # f.input :parent_id, as: :select, collection: Category.where("depth != 2 AND id != ?", category.id).pluck(:name, :id), include_blank: 'Select Parent'
      f.input :parent_id, :as => :select, :collection => nested_set_options(Category, category) {|i| "#{' -' * i.level} #{i.name}" },  :input_html => { :class => 'select2'}
      f.input :name
      f.input :status
    end
    f.inputs "Image", for: [:image, f.object.image || Image.new] do |image|
      image.input :image, as: :file, :hint => image_tag(f.object.try(:image).try(:image).try(:url, :thumb))
      image.input :image_cache, :as => :hidden
    end
    f.actions
  end

  # Show Page
  show do
    attributes_table do
      row :name
      row :parent_id
      row :image do |cat|
        unless !cat.image.present?
          image_tag(cat.try(:image).try(:image).try(:url, :medium))
        else
          image_tag('/assets/default-blog.png', height: '50', width: '50')
        end
      end
      row :status
      row :created_at
    end
  end

  batch_action "Update 'Status' for", form: { status: [['Active',1],['Inactive',0]] } do |ids, inputs|
    Category.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end

end