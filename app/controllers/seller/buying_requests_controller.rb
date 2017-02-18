class Seller::BuyingRequestsController < Seller::BaseController
   before_action :find_associated_data, only: [:edit, :new, :create, :update]

	def index
		if current_user.present?
			@buying_requests = BuyingRequest.approved.order("created_at DESC").search(params[:q]).page(params[:page])
		else
			redirect_to root_url
		end
	end

	def show
		if current_user.present?			
			@buying_request = BuyingRequest.approved.find(params[:id])
		else
			redirect_to root_url
		end
	end
	def request_for_more_info
		@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(params[:buying_request_id])
		@request_for_more_info = BuyingRequestMoreDetail.new
	end

	def send_request_for_more_info
		@request_for_more_info = BuyingRequestMoreDetail.new(buying_request_more_detail_params)
		if @request_for_more_info.save
			flash[:notice] = "Request sent successfully."
			redirect_to seller_buying_requests_path
		else
			@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(buying_request_more_detail_params[:buying_request_id])
			render :request_for_more_info
		end
	end
	
	def my_buying_request_list
		if current_user.present?
			@buying_requests = BuyingRequest.all.order("created_at DESC").where('(buying_requests.user_id = ? OR buying_requests.email = ?)', current_user, current_user.email).page(params[:page])
		
			render :index
						
		else
			redirect_to root_url
		end
	end	
	
	def my_buying_request_show
		if current_user.present?			
			@buying_request = BuyingRequest.where('buying_requests.id = ? AND (buying_requests.user_id = ? OR buying_requests.email = ?)', params[:id], current_user, current_user.email).first
						
			if !@buying_request 
				flash[:error] = "Invalid Access !"
				redirect_to seller_my_buying_request_list_path
			else
				render :show
			end	
		else
			redirect_to root_url
		end
	end
		
	def destroy
		if BuyingRequest.destroy(params[:id])
			flash[:notice] = "Buying request successfully removed."
		else
			flash[:notice] = "Failed to delete"
		end
		redirect_to seller_my_buying_request_list_path
	end
	
	def new
		
		@buying_request = BuyingRequest.new
		@buying_request.images.build
		
		@page_content_data = PageContentManagement.where(:page_url => "post_buying_requests")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
		
	end
	
	def create
	
		if params[:buying_request][:images_attributes].present?
			params[:buying_request][:images_attributes].each do |index,img|
				unless params[:buying_request][:images_attributes][index][:image].present?
					params[:buying_request][:images_attributes][index][:image] = params[:buying_request][:images_attributes][index][:image_cache]
				end
			end
		end

	    @tmp_images = {}
	    temp_image_attributes = {}

	    new_params = buying_request_params
    
		@buying_request = BuyingRequest.new(buying_request_params)
		if @buying_request.valid?
			if new_params[:brand_id] == "0"
	      if params[:other][:manufacturer_name].present?
	        manufacturer = Manufacturer.find_or_create_by(:name => params[:other][:manufacturer_name], :status => 1)
	        new_params[:brand_id] = manufacturer.id
	      else
	        new_params.delete(:brand_id)
	      end
	    end
	   
	    if new_params[:category_id] == "0"
	    	if new_params[:category_name].present?
	    		new_params.delete(:category_id)
	    	end
	    end
	    
      @buying_request = BuyingRequest.new(new_params)
		end
		@buying_request.status = "New"

     if buying_request_params[:images_attributes].present?
      index = 0
      buying_request_params[:images_attributes].each do |key,value|
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
     
		if @buying_request.save
			@tmp_images.each do |key, tmp_image|
			img_path = Rails.root.to_s + '/public' + tmp_image
			if File.exists?(img_path)
			  buying_request_image = @buying_request.images.new
			  buying_request_image.image = File.open(img_path , 'rb')
			  buying_request_image.save
			end
		end
			redirect_to seller_my_buying_request_list_path, notice: 'Successfully Created'
		else
		
      @tmp_images.each do |key, tmp_image|
        img_path = Rails.root.to_s + '/public' + tmp_image
        if File.exists?(img_path)
          buying_request_image = @buying_request.images.new
          buying_request_image.image = File.open(img_path , 'rb')
        end
      end
      @buying_request.images.build if (@buying_request.images.count==0 && index < 4)
      
		@page_content_data = PageContentManagement.where(:page_url => "post_buying_requests")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
      
      render 'new'
		end
	end
	
	def edit
		@buying_request = BuyingRequest.find(params[:id])
		
		@page_content_data = PageContentManagement.where(:page_url => "post_buying_requests")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
		
		render 'new'
	end
	
	def update
	
		@buying_request = BuyingRequest.find(params[:id])
				
		if params[:buying_request][:images_attributes].present?
		  params[:buying_request][:images_attributes].each do |index,img|
			unless params[:buying_request][:images_attributes][index][:image].present?
			  params[:buying_request][:images_attributes][index][:image] = params[:buying_request][:images_attributes][index][:image_cache]
			end
		  end
		end

		@tmp_images = {}
		temp_image_attributes = {}

		new_params = buying_request_params
		
		@buying_request.assign_attributes( new_params.except(:images_attributes) )
		
		if @buying_request.valid?
			if new_params[:brand_id] == "0"
			  if params[:other][:manufacturer_name].present?
				manufacturer = Manufacturer.find_or_create_by(:name => params[:other][:manufacturer_name], :status => 1)
				new_params[:brand_id] = manufacturer.id
			  else
				new_params.delete(:brand_id)
			  end
			end
			if new_params[:category_id] == "0"
				if new_params[:category_name].present?
					new_params.delete(:category_id)
				end
			end
		end

		if buying_request_params[:images_attributes].present?
		  index = 0
		  buying_request_params[:images_attributes].each do |key,value|
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
		
		if @buying_request.update(new_params)
			@tmp_images.each do |key, tmp_image|
				img_path = Rails.root.to_s + '/public' + tmp_image
				if File.exists?(img_path)
				  buying_request_image = @buying_request.images.new
				  buying_request_image.image = File.open(img_path , 'rb')
				  buying_request_image.save
				end
			end
			redirect_to seller_my_buying_request_list_path, notice: 'Successfully Updated'
		else
		  @tmp_images.each do |key, tmp_image|
			img_path = Rails.root.to_s + '/public' + tmp_image
			if File.exists?(img_path)
			  buying_request_image = @buying_request.images.new
			  buying_request_image.image = File.open(img_path , 'rb')
			end
		  end
		  @buying_request.images.build if (@buying_request.images.count==0 && index < 4)
		  
			@page_content_data = PageContentManagement.where(:page_url => "post_buying_requests")
			@content_data = {}
			@page_content_data.each do |v|		
				@content_data[v.page_section] = v.content		
			end
		  
		  render 'new'
		end
	end

	private

	def buying_request_params
		params.require(:buying_request).permit(:user_id, :title, :origin, :city, :delivery_port, :other_information, :prefered_currency, :end_user, :location_id, :brand_id, :category_id, :lead_type, :condition, :expiration_date, :attachment, :image, :description, :name, :email, :mobile, :country_id, :company_name, :company_website, :address, :image_cache, :attachment_cache, :category_name, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache])
	end
	def buying_request_more_detail_params
		params.require(:buying_request_more_detail).permit(:receiver, :subject, :message, :attachment, :user_id, :buying_request_id, :status, :bootsy_image_gallery_id)
	end
	def find_associated_data
		@currencies = Currency.active.pluck(:name,:symbol)
		@manufacturers = Manufacturer.active.joins(:equipments).distinct
		@categories = Category.active.all
	end
		
end
