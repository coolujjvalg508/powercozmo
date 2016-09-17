ActiveAdmin.register Equipment do
  menu label: 'Equipments', if: proc{ (current_admin_user.has_permission('equipment_read') || current_admin_user.has_permission('equipment_write') || current_admin_user.has_permission('equipment_delete'))}
	permit_params :name, :equipment_model, :condition, :owner_name, :manufacturer_id, :category_id, :sub_category_id, :sub_sub_category_id, :city, :country_id, :price, :currency, :rating, :description, :status, :availble_for,:availble_for_date, :availble_for_time_hour, :availble_for_time_minute, :manufacture_year, :user_id,:availble_for, :power_plant_age, :power_plant_type, :turbine_model, :turbine_manufacturer_name, :equipment_type, :faults, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache]

  batch_action "Update 'Status' for", form: { status: Equipment.statuses.map{|status, value| [status.to_s.humanize, status.to_s] } } do |ids, inputs|
    # Equipment.where(id: ids).update_all(status: inputs[:status])
    # removing update_all to make the query use callbacks
    failed = nil
    Equipment.where(id: ids).find_each do |e|
      unless e.update_attributes(status: inputs[:status])
        failed = true
      end
    end
    if failed
      flash[:warning] = "Update skipped for some expired record"
    else
      flash[:notice] = "Updated successfully"
    end
    redirect_to collection_path
  end

  action_item :back, only: :show do
   link_to "Back", collection_path, method: :get
  end

  scope :active
  scope :inactive
  scope :closed

  collection_action :categories, method: :get do
    category = Category.active.where(id: params[:id].to_i).first
    sub_categories = category.present? ? category.children.active : []
    render json: sub_categories, status: 200
  end

  controller do

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('equipment_read') && !current_admin_user.has_permission('equipment_write') && !current_admin_user.has_permission('equipment_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('equipment_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('equipment_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('equipment_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('equipment_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('equipment_delete'))
        super - disallowed
      end
    end

    def create
      if params[:equipment].present?
        if params[:equipment][:equipment_type] == "power_plant"
          p_category = Category.find_by_name("Complete power plant").id
          params[:equipment][:category_id] = p_category
        end
      end
      if (params[:equipment].present? && params[:equipment][:images_attributes].present?)
        params[:equipment][:images_attributes].each do |index,img|
          unless params[:equipment][:images_attributes][index][:image].present?
            params[:equipment][:images_attributes][index][:image] = params[:equipment][:images_attributes][index][:image_cache]
          end
        end
        super
      else
        super
      end
    end
    def update
      if params[:equipment].present?
        if params[:equipment][:equipment_type] == "power_plant"
          p_category = Category.find_by_name("Complete power plant").id
          params[:equipment][:category_id] = p_category
        end
      end
      if (params[:equipment].present? && params[:equipment][:images_attributes].present?)
        params[:equipment][:images_attributes].each do |index,img|
          unless params[:equipment][:images_attributes][index][:image].present?
            params[:equipment][:images_attributes][index][:image] = params[:equipment][:images_attributes][index][:image_cache]
          end
        end
        super
      else
        super
      end
    end
  end
  form html: { multipart: true } do |f|
    f.semantic_errors # shows errors on :base
    f.inputs do
      f.input :equipment_type, as: :radio, input_html: {:disabled => !f.object.new_record?}
      f.input :name
      # f.input :identifier, label: 'Identifier'
      f.input :equipment_model
      f.input :condition, as: :select, collection: Equipment::CONDITION_TYPES, include_blank: 'Select Equipment Condition'
      f.input :power_plant_type, as: :select, collection: Equipment::POWER_PLANT_TYPES, include_blank: 'Select Power Plant Type'
      f.input :power_plant_age
      f.input :owner_name
      f.input :turbine_model
      f.input :turbine_manufacturer_name
      f.input :manufacturer_id, as: :select, collection: Hash[Manufacturer.active.pluck(:id, :name)].map{|id,name| [name,id] }, include_blank: 'Select Manufacturer'
      f.input :category_id, as: :select, collection: Hash[Category.roots.active.pluck(:id, :name)].map{|id,name| [name,id] }, include_blank: 'Select Category', label: 'Category<abbr title="required">*</abbr>'.html_safe
      @sub_categories = {}
      if f.object.category_id.present?
        category = Category.active.where(id: f.object.category_id).first
        @sub_categories = Hash[category.children.active.pluck(:id, :name)] if category.present?
      end
      @child_categories = {}
      if f.object.sub_category_id.present?
        sub_category = Category.active.where(id: f.object.sub_category_id).first
        @child_categories = Hash[sub_category.children.active.pluck(:id, :name)] if sub_category.present?
      end
      f.input :sub_cat_id, :as => :hidden
      f.input :sub_category_id, as: :select, collection: @sub_categories.map{|id,name| [name,id] }, include_blank: 'Select Sub Category'
      f.input :sub_sub_category_id, as: :select, collection: @child_categories.map{|id,name| [name,id] }, include_blank: 'Select Sub Sub Category'
      f.input :city
      f.input :country_id, as: :select, collection: @countries = Hash[Country.active.pluck(:id, :name)].map{|id,name| [name,id] }, include_blank: 'Select Country', label: 'Country<abbr title="required">*</abbr>'.html_safe
      f.input :description
      f.input :faults
      f.input :availble_for, label: 'Expiration Date', as: :just_datetime_picker#:string, input_html: {:class => "hasDatetimePicker"}
      f.input :manufacture_year, as: :select, collection: (1950..Date.today.year).to_a.reverse, include_blank: 'Select Year'
      f.input :price
      f.input :currency, as: :select, collection: Hash[Currency.active.pluck(:name,:symbol)].map{|name,symbol| [(name.to_s+' (<span>'+symbol.to_s+'</span>)').html_safe,symbol] }, include_blank: 'Select Currency'
      f.input :rating, as: :select, collection: (1..5).to_a, include_blank: 'Select Rating'
      f.input :user_id, label: 'Seller', as: :select, collection: User.select_options, include_blank: 'Select Seller'
      if ((controller.action_name == 'edit' || controller.action_name == 'update') && ["inactive","active"].include?(f.object.status))
        f.input :status
      end
      f.inputs 'Images' do
        f.has_many :images, allow_destroy: true, new_record: true do |ff|
          ff.input :image, as: :file, label: "Image", hint: ff.template.image_tag(ff.object.image.try(:url))
          ff.input :image_cache, :as => :hidden
        end
      end

    end
    f.actions
  end

  # Filters
  filter :name
  filter :equipment_type, as: :select, collection: [['Equipment', 'equipment'], ['Power Plant', 'power_plant']]
  filter :identifier, label: 'Equipment Identifier'
  filter :equipment_model, label: 'Equipment Model'
  filter :condition, as: :select, collection: Equipment::CONDITION_TYPES, include_blank: 'Select Equipment Condition'
  filter :owner_name
  filter :manufacturer_id, as: :select, collection: -> { Hash[Manufacturer.active.pluck(:id, :name)].map{|id,name| [name,id] } }, include_blank: 'Select Manufacturer'
  filter :category_id, as: :select, collection: -> { Hash[Category.roots.active.pluck(:id, :name)].map{|id,name| [name,id] } }, include_blank: 'Select Category'
  filter :price
  filter :country_id, as: :select, collection: @countries = -> { Hash[Country.active.pluck(:id, :name)].map{|id,name| [name,id] } }, include_blank: 'Select Country'
  filter :availble_for, label: 'Expiration Date'
  filter :rating, as: :select, collection: (1..5).to_a, include_blank: 'Select Rating'
  filter :user_id, label: 'Seller', as: :select, collection: -> { User.select_options }, include_blank: 'Select Seller'
  filter :status, as: :select, collection: Equipment.statuses.map{|status, value| [status.to_s.humanize, value] }, include_blank: 'Select Status'
  filter :created_at
  filter :updated_at

  # Index page
  index :download_links => ['csv'] do
    selectable_column
    column :name
    column 'Equipment Identifier', sortable: :identifier do |equipment|
      equipment.identifier
    end
    column :equipment_model
    column :condition
    column :owner_name
    column :manufacturer_id

    column :category_id
    # column :sub_category_id
    # column :sub_sub_category_id
    # column :city
    column :country_id
    column 'Price' do |equipment|
      equipment.currency.to_s.html_safe+equipment.price.to_s
    end
    column 'Expiration Date', sortable: :availble_for do |equipment|
      equipment.availble_for.strftime("%d-%b-%Y %H:%M") if equipment.availble_for.present?
    end
    # column :manufacture_year
    column :rating
    column 'Seller', sortable: :user_id do |equipment|
      name = equipment.user.try(:name).to_s
      name = equipment.user.email unless name.present?
      link_to name, admin_seller_path(equipment.user)
    end
    column :status do |equipment|
      equipment.status.to_s.humanize
    end
    column :created_at
    column :updated_at
    actions
  end

  csv do
    column :name
    column 'Equipment Identifier', sortable: :identifier do |equipment|
      equipment.identifier
    end
    column :equipment_model
    column :condition
    column :owner_name
    column 'Manufacturer' do |equipment|
      equipment.try(:manufacturer).try(:name)
    end
    column 'Category' do |equipment|
      equipment.try(:category).try(:name)
    end
    column 'Country' do |equipment|
      equipment.try(:country).try(:name)
    end
    column 'Price' do |equipment|
      strip_tags(equipment.currency.to_s)+equipment.price.to_s
    end
    column 'Expiration Date', sortable: :availble_for do |equipment|
      equipment.availble_for.strftime("%d-%b-%Y %H:%M") if equipment.availble_for.present?
    end
    column :rating
    column 'Seller', sortable: :user_id do |equipment|
      name = equipment.user.try(:name).to_s
      name = equipment.user.email unless name.present?
      name
    end
    column :status do |equipment|
      equipment.status.to_s.humanize
    end
    column :created_at
  end

  # Show Page
  show do
    attributes_table do
      row :name
      row 'Identifier' do
        equipment.identifier
      end
      if equipment.equipment_type == "equipment"
        row :equipment_model
        row :condition
      end
      if equipment.equipment_type == "power_plant"
        row :power_plant_type
        row :power_plant_age
        row :turbine_model
        row :turbine_manufacturer_name
      end
      row :owner_name
      row :manufacturer_id
      row :category_id
      row :sub_category_id
      if equipment.equipment_type == "equipment"
        row :sub_sub_category_id
      end
      row :city
      row :country_id
      row 'Price' do
        equipment.currency.to_s.html_safe+equipment.price.to_s
      end
      row :description
      row 'Expiration Date' do
        equipment.availble_for.strftime("%d-%b-%Y %H:%M") if equipment.availble_for.present?
      end
      if equipment.equipment_type == "equipment"
        row :manufacture_year
      end
      row :rating
      row 'Seller' do
        name = equipment.user.try(:name).to_s
        name = equipment.user.email if name.blank?
        link_to name, admin_seller_path(equipment.user)
      end
      row :faults
      row :status do
        equipment.status.to_s.humanize
      end
      row :created_at
      row :updated_at
      row 'Images' do
        ul class: "image-blk" do
          equipment.images.each do |img|
            li do
              image_tag(img.image.medium.url, class: "show-img")
            end
          end
        end
      end
    end
  end

end
