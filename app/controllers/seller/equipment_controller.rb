class Seller::EquipmentController < Seller::BaseController
  before_action :find_equipment, only: [:edit,:update,:show,:destroy]
  before_action :get_equipment_form_data, only: [:new, :create,:edit,:update]
  
  layout 'user'
  
  def index
  	@equipments = current_user.equipment.all.order('created_at desc').page(params[:page]).per(10)
  end

  def filter
    condition = []
    if params[:q]
      @equipments = current_user.equipment.where("description LIKE (?) OR name LIKE (?) OR identifier LIKE (?)", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%").order('created_at desc').page(params[:page]).per(10)
    else
      @equipments = current_user.equipment.order('created_at desc').page(params[:page]).per(10)
    end
    render :index
  end

  def new
  	@equipment = current_user.equipment.new
    @equipment.images.build
  end

  def create
    
    if params[:equipment][:images_attributes].present?
      params[:equipment][:images_attributes].each do |index,img|
        unless params[:equipment][:images_attributes][index][:image].present?
          params[:equipment][:images_attributes][index][:image] = params[:equipment][:images_attributes][index][:image_cache]
        end
      end
    end
    @tmp_images = {}
    temp_image_attributes = {}
    new_params = equipment_params
    if equipment_params[:equipment_type] == "power_plant"
      p_category = Category.find_by_name("Complete power plant").id
      new_params[:category_id] = p_category
    end
    @equipment = current_user.equipment.new(new_params)
    if @equipment.valid?
      new_params = process_new_master_data(p_category)
      @equipment = current_user.equipment.new(new_params)
    end
    if equipment_params[:images_attributes].present?
      index = 0
      equipment_params[:images_attributes].each do |key,value|
        next if value[:_destroy]=="1"
        temp_image_attributes[index.to_s] = value
        index += 1
      end
      temp_image_attributes.each do |key, value|
        if value[:tmp_image].present? && value[:_destroy]=="false" && !value[:image].present?
          @tmp_images[key] = value[:tmp_image]
        end
      end
    end
    if @equipment.save
      @tmp_images.each do |key, tmp_image|
        img_path = Rails.root.to_s + '/public' + tmp_image
        if File.exists?(img_path)
          equipment_image = @equipment.images.new
          equipment_image.image = File.open(img_path , 'rb')
          equipment_image.save
        end
      end
      if @new_category_name.present?
        EquipmentMailer.delay.new_category_notification(@field.gsub('_',' '),@new_category_name)
      end
      flash[:notice] = "Equipment was successfully created."
      redirect_to seller_equipment_index_path
    else
      @tmp_images.each do |key, tmp_image|
        img_path = Rails.root.to_s + '/public' + tmp_image
        if File.exists?(img_path)
          equipment_image = @equipment.images.new
          equipment_image.image = File.open(img_path , 'rb')
        end
      end
      @equipment.images.build if (@equipment.images.count==0 && index < 4)
      category = Category.active.where(id: @equipment.category_id).first
  		@sub_categories = Hash[category.children.active.pluck(:id, :name)] if category.present?
      sub_category = Category.active.where(id: @equipment.sub_category_id).first
  		@child_categories = Hash[sub_category.children.active.pluck(:id, :name)] if sub_category.present?
      render 'new'
  	end
  end

  def edit
    @equipment.images.build if @equipment.images.count==0
  end

  def update
    new_params = equipment_params
    # if(@equipment.equipment_type != new_params[:equipment_type])
    if params[:equipment][:images_attributes].present?
      params[:equipment][:images_attributes].each do |index,img|
        unless params[:equipment][:images_attributes][index][:image].present?
          params[:equipment][:images_attributes][index][:image] = params[:equipment][:images_attributes][index][:image_cache]
        end
      end
    end
    @tmp_images = {}
    temp_image_attributes = {}
    if equipment_params[:equipment_type] == "power_plant"
      p_category = Category.find_by_name("Complete power plant").id
      new_params[:category_id] = p_category
    end
    @equipment.assign_attributes( new_params.except(:images_attributes) )
    if @equipment.valid?
      new_params = process_new_master_data(p_category)
    else
      new_params = equipment_params
    end
    if equipment_params[:images_attributes].present?
      index = 0
      equipment_params[:images_attributes].each do |key,value|
        next if value[:_destroy]=="1"
        temp_image_attributes[index.to_s] = value
        index += 1
      end
      temp_image_attributes.each do |key, value|
        if value[:tmp_image].present? && value[:_destroy]=="false" && !value[:image].present?
          @tmp_images[key] = value[:tmp_image]
        end
      end
    end
    if @equipment.update(new_params)
      @tmp_images.each do |key, tmp_image|
        img_path = Rails.root.to_s + '/public' + tmp_image
        if File.exists?(img_path)
          equipment_image = @equipment.images.new
          equipment_image.image = File.open(img_path , 'rb')
          equipment_image.save
        end
      end
      if @new_category_name.present?
        EquipmentMailer.delay.new_category_notification(@field.gsub('_',' '),@new_category_name)
      end
      flash[:notice] = "Equipment was successfully updated."
      redirect_to seller_equipment_index_path
    else
      if params[:equipment][:availble_for] < DateTime.now
        flash[:error] = "Please extend the Expiration Date for updating any data."
      end
      @tmp_images.each do |key, tmp_image|
        img_path = Rails.root.to_s + '/public' + tmp_image
        if File.exists?(img_path)
          equipment_image = @equipment.images.new
          equipment_image.image = File.open(img_path , 'rb')
        end
      end
      @equipment.images.build if (@equipment.images.count==0 && index < 4)
      category = Category.active.where(id: @equipment.category_id).first
      @sub_categories = Hash[category.children.active.pluck(:id, :name)] if category.present?
      sub_category = Category.active.where(id: @equipment.sub_category_id).first
      @child_categories = Hash[sub_category.children.active.pluck(:id, :name)] if sub_category.present?
      render 'edit'
    end
  end

  def show
    redirect_to seller_equipment_index_path
  end

  def destroy
    @equipment.destroy
    flash[:notice] = "Equipment was successfully removed."
    redirect_to seller_equipment_index_path
  end

  def categories
    category = Category.active.where(id: params[:id].to_i).first
    sub_categories = category.present? ? category.children.active : []
  	render json: sub_categories, status: 200
  end

  def process_new_master_data(power_plant_category = nil)
    new_params = equipment_params
    new_params[:category_id] = power_plant_category if power_plant_category.present?
    if new_params[:manufacturer_id] == "0"
      if params[:other][:manufacturer_name].present?
        manufacturer = Manufacturer.find_or_create_by(:name => params[:other][:manufacturer_name], :status => 1)
        new_params[:manufacturer_id] = manufacturer.id
      else
        new_params.delete(:manufacturer_id)
      end
    end

    ['category_id', 'sub_category_id', 'sub_sub_category_id'].each do |attribute|
      if new_params[attribute] == '0'
        @field = attribute[0..-4]
        @new_category_name = params[:other]["#{@field}_name".to_sym]
        if @new_category_name.present?
          category_params = {:name => @new_category_name,:status => "inactive"}
          if attribute == 'sub_sub_category_id'
            category_params[:parent_id] = new_params[:sub_category_id]
          elsif attribute == 'sub_category_id'
            category_params[:parent_id] = new_params[:category_id]
          end
          new_category = Category.create(category_params)
          if attribute == 'category_id'
            new_params[:sub_category_id] = nil
            new_params[:sub_sub_category_id] = nil
          elsif attribute == 'sub_category_id'
            new_params[:sub_sub_category_id] = nil
          end
          new_params[attribute.to_sym] = new_category.id
          new_params[:status] = "inactive"
          new_params[:require_moderation] = true
        else
          new_params[attribute.to_sym] = nil
        end
      end
    end
    new_params
  end
  
  def favourites
	@equipments = Favorite.all.joins(:equipment).where('equipment.status != "0" AND favorites.user_id = ?', current_user.id).order('created_at desc').page(params[:page]).per(10)
		
  end
  
  def remove_favourite
		Favorite.delete(params[:id])
		flash[:notice] = "Equipment successfully removed from favourites."
		redirect_to seller_favourites_path
  end

  private

	def equipment_params
	 params.require(:equipment).permit(:name, :equipment_model, :condition, :owner_name, :manufacturer_id, :category_id, :sub_category_id, :sub_sub_category_id, :city, :country_id, :price, :currency, :rating, :description, :status, :manufacture_year, :user_id, :availble_for, :power_plant_age, :power_plant_type, :turbine_model, :turbine_manufacturer_name, :require_moderation, :equipment_type, :faults, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache])
	end

  def find_equipment
    @equipment = current_user.equipment.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:error] = "Equipment not found."
      redirect_to seller_equipment_index_path
  end

  def get_equipment_form_data
    @manufactures = Hash[Manufacturer.active.pluck(:id, :name)]
    @countries = Hash[Country.active.pluck(:id, :name)]
    @categories = Hash[Category.roots.active.pluck(:id, :name)]
    @currencies = Currency.active.pluck(:name,:symbol)
    @sub_categories = {}
    @child_categories = {}
    if @equipment.present?
      category = Category.where(id: @equipment.category_id).first
      @categories[category.id] ||= category.name if category.present?
      @sub_categories = Hash[category.children.active.pluck(:id, :name)] if category.present?
      sub_category = Category.active.where(id: @equipment.sub_category_id).first
      @sub_categories[sub_category.id] ||= sub_category.name if sub_category
      @child_categories = Hash[sub_category.children.active.pluck(:id, :name)] if sub_category.present?
      @child_categories[@equipment.sub_sub_category.id] ||= @equipment.sub_sub_category.name if @equipment.sub_sub_category_id
    end
  end
end
