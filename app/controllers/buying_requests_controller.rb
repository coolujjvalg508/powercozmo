class BuyingRequestsController < ApplicationController
	before_action :find_associated_data, only: [:index, :filter, :edit]
		
	def index
		@buying_requests = BuyingRequest.approved.order("created_at DESC").search(params[:q]).page(params[:page])
		
		@page_content_data = PageContentManagement.where(:page_url => "buying_requests")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
		
	end

	def filter
	
		@page_content_data = PageContentManagement.where(:page_url => "buying_requests")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	
		condition = []
		if params[:filter]
			attributes = filter_params
			attributes.delete_if {|k,v| v.blank?}
			attributes.each do |attribute, value|
				condition << "#{attribute.to_s} = ?"
			end
		end
		if condition.length > 0
			@buying_requests = BuyingRequest.where([condition.join(' AND '), *attributes.values]).approved.order('id').page params[:page]
		else
			@buying_requests = BuyingRequest.order("created_at DESC").approved.page params[:page]
		end
		render :index
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
			redirect_to new_buying_request_path, notice: 'Successfully Created'
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
		params.require(:buying_request).permit(:user_id, :title, :origin, :city, :end_user, :location_id, :brand_id, :category_id, :lead_type, :condition, :expiration_date, :attachment, :image, :description, :name, :email, :mobile, :country_id, :company_name, :company_website, :address, :image_cache, :attachment_cache, :category_name, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache])
	end

	def filter_params
		params.require(:filter).permit(:brand_id, :category_id, :lead_type)
	end

	def find_associated_data
		@manufacturers = Manufacturer.active.joins(:equipments).distinct
		@categories = Category.active.all
	end
end
