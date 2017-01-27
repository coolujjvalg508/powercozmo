class Seller::EquipmentController < Seller::BaseController
  before_action :find_equipment, only: [:edit,:update,:show,:destroy]
  before_action :get_equipment_form_data, only: [:new, :create,:edit,:update]
    
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

    @page_content_data = PageContentManagement.where(:page_url => "equipment_add")
    @content_data = {}
    @page_content_data.each do |v|    
      @content_data[v.page_section] = v.content   
    end
  end

  def create

    @page_content_data = PageContentManagement.where(:page_url => "equipment_add")
    @content_data = {}
    @page_content_data.each do |v|    
      @content_data[v.page_section] = v.content   
    end

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
      
      
      #######package detail start #####
      
		shipping_package = params[:equipment][:shipping_package]

		if shipping_package
					
			shipping_package.each_with_index do |s_package, index| 
				
				length = s_package[1][:length]
				width = s_package[1][:width]
				height = s_package[1][:height]
				weight = s_package[1][:weight]
				
				if length != '' || width != '' || height != '' || weight != ''
					ShippingPackage.create(equipment_id: @equipment.id, order_id: 0, length: length, width: width, height: height, weight: weight)
				end
			 end
		 end
	     
      
      #######package detail end ####
            
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
      
      @categories = Hash[Category.roots.active.where(category_type: @equipment[:category_type]).pluck(:id, :name)]
      
      category = Category.active.where(id: @equipment.category_id).first
  		@sub_categories = Hash[category.children.active.pluck(:id, :name)] if category.present?
      sub_category = Category.active.where(id: @equipment.sub_category_id).first
  		@child_categories = Hash[sub_category.children.active.pluck(:id, :name)] if sub_category.present?
  		
      render 'new'
  	end
  end

  def edit
    @equipment.images.build if @equipment.images.count==0

    @page_content_data = PageContentManagement.where(:page_url => "equipment_add")
    @content_data = {}
    @page_content_data.each do |v|    
      @content_data[v.page_section] = v.content   
    end

  end

  def update

    @page_content_data = PageContentManagement.where(:page_url => "equipment_add")
    @content_data = {}
    @page_content_data.each do |v|    
      @content_data[v.page_section] = v.content   
    end

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
      
      #######package detail start #####
      
		i = 0
		shipping_package = params[:equipment][:shipping_package]

		if shipping_package
			
			@order = Order.find_by(equipment_id: @equipment.id)
      		  
			if @order
				order_id = @order.id
			else
				order_id = 0
			end
		
			shipping_package.each_with_index do |s_package, index| 
				
				length = s_package[1][:length]
				width = s_package[1][:width]
				height = s_package[1][:height]
				weight = s_package[1][:weight]
				
				if length != '' || width != '' || height != '' || weight != ''
					if i == 0
						ShippingPackage.where(equipment_id: @equipment.id).delete_all
					end
					ShippingPackage.create(equipment_id: @equipment.id, order_id: order_id, length: length, width: width, height: height, weight: weight)
					i = i + 1
				end
			 end
			 if i == 0
				ShippingPackage.where(equipment_id: @equipment.id).delete_all
			 end
			 if @order
				@order.update(no_of_packages: i)
			 end
		 end
	     
      
      #######package detail end ####      
      
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
      
      @categories = Hash[Category.roots.active.where(category_type: @equipment[:category_type]).pluck(:id, :name)]
      
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
  
  def categories_by_category_type
    category = Category.active.where(category_type: params[:category_type].to_s)
  	render json: category, status: 200
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
        
          if attribute == 'category_id'
			category_type = params[:equipment][:category_type].to_s
          else
			category_type = ''
          end
                    
          category_params = {:name => @new_category_name,:status => "inactive", :category_type => category_type}
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
	
	  @categories = Category.active.order(name: :asc).roots.joins("LEFT JOIN preferences ON (preferences.category_id = categories.id AND preferences.user_id = #{current_user.id})").select('categories.*, preferences.user_id, preferences.category_id')

    @latest_ads = Equipment.where("created_at > ? ", 30.days.ago).active.order('created_at DESC').limit(3)
    @popular_ads = Equipment.popular.limit(3)
				
  end
  
  def remove_favourite
		Favorite.delete(params[:id])
		flash[:notice] = "Equipment successfully removed from favourites."
		redirect_to seller_favourites_path
  end
  
  def add_preference
	
		preference_data = Preference.where('preferences.user_id = ? AND preferences.category_id = ?', current_user.id, params[:category_id]).first
	
		if preference_data
			render json: {message: 'Already in preferences !', status: '201'}
		else
			Preference.create(user_id: current_user.id, category_id: params[:category_id])
			
			render json: {message: 'Category successfully added in preferences.', status: '200'}
			
		end
	
  end
	
  def remove_preference
		Preference.where(user_id: current_user.id, category_id: params[:category_id]).delete_all
		render json: {message: 'Category successfully removed from preferences.', status: '200'}
  end

  def available_for_preview

    require 'date'

    render layout: false

  end
  

  private

	def equipment_params
	 params.require(:equipment).permit(:name, :equipment_model, :condition, :owner_name, :manufacturer_id, :category_type, :category_id, :sub_category_id, :sub_sub_category_id, :city, :country_id, :price, :currency, :rating, :description, :status, :manufacture_year, :user_id, :availble_for, :power_plant_age, :power_plant_type, :turbine_model, :turbine_manufacturer_name, :require_moderation, :equipment_type, :faults, :pickup_port, :minimum_accepted_price, :keywords, :attachment, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache])
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
    #@categories = Hash[Category.roots.active.pluck(:id, :name)]
    @categories = {}
    @currencies = Currency.active.pluck(:name,:symbol)
    @sub_categories = {}
    @child_categories = {}
    if @equipment.present?
	  @categories = Hash[Category.roots.active.where(category_type: @equipment[:category_type]).pluck(:id, :name)]
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
