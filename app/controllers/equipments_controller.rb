class EquipmentsController < ApplicationController
	before_action :find_associated_data, only: [:index, :filter]
		
	def index
		@equipments = Equipment.not_inactive.order('created_at desc').page params[:page]
		
		@page_content_data = PageContentManagement.where(:page_url => "listings")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end	
				
	end
	
	def index_solr_backup
	
		@page_content_data = PageContentManagement.where(:page_url => "listings")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	
		#@equipments = Equipment.not_inactive.order('created_at desc').page params[:page]
		search = Equipment.solr_search do 
		
			 #without :status, 0
			 			 
			 paginate :page => params[:page], :per_page => 12
			 order_by :created_at, :desc
		end
		
		@equipments = search.results
		
		#abort(@equipments.to_json)
	end

	def equipment_details
	
		@page_content_data = PageContentManagement.where(:page_url => "equipment_details")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	
		@top_bar_ad = Advertisement.where(:active => 1).find_by_page_reference('listing details top horizontal').try(:image).try(:image).try(:ad_horizontal).try(:url)
		@side_panel_ad = Advertisement.where(:active => 1).find_by_page_reference('listing details right panel').try(:image).try(:image).try(:ad_square).try(:url)
		@equipment = Equipment.not_inactive.includes(:country, :manufacturer, :category, :user).find_by_id(params[:id])
		
		if @equipment
		
			if current_user
				@favorite_data = Favorite.where('favorites.user_id = ? AND favorites.equipment_id = ?', current_user.id, @equipment.id).first
			end 
		
			['sub_sub_category_id', 'sub_category_id', 'category_id'].each do |attribute|
				value = @equipment.send(attribute)
				if value.present?
					@similar_products = Equipment.not_inactive.where("#{attribute.to_sym} = ? AND id != ?", value, @equipment.id)
					if @similar_products.count >= 12
						break
					end
				end
			end
		else
			flash[:notice] = "Equipment not found."
			redirect_to listings_path and return
		end
		@countries = Country.active.all
		respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "power_cozmo_#{@equipment.name}",
        			 :layout => 'listing_detail_pdf.html.erb',
        			 :disposition => 'attachment'
      end
    end
	end
	
	def filter
	
		@page_content_data = PageContentManagement.where(:page_url => "listings")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	
		if params[:q].present?
			@search = Equipment.not_inactive.search(params[:q])
			@search.sorts = 'created_at desc' if @search.sorts.empty?
			@search_result = @search.result
		else
			@search_result = "Equipment".constantize
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
			@equipments = @search_result.not_inactive.where([condition.join(' AND '), *attributes.values]).order('created_at desc').page params[:page]
		else
			@equipments = @search_result.not_inactive.order('created_at desc').page(params[:page])
		end
		render :index
	end

	def filter_solr_backup
		
		@page_content_data = PageContentManagement.where(:page_url => "listings")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	
		search_qry = {}
	
		search = Equipment.solr_search do
			
			#without(:status, 0)
			
			if params[:filter]
				attributes = filter_params
				attributes.delete_if {|k,v| v.blank?}
				attributes.each do |attribute, value|
					with attribute.to_s, value
					
					search_qry[attribute] = value
				end
			end
			
			if params[:q]
				attributes_q = params[:q]
				attributes_q.delete_if {|k,v| v.blank?}
				attributes_q.each do |attribute_q, value_q|
								
					any do
						fulltext value_q, :fields => :name
						fulltext value_q, :fields => :identifier
						fulltext value_q, :fields => :country_name
						fulltext value_q, :fields => :description
						fulltext value_q, :fields => :manufacturer_name
						fulltext value_q, :fields => :category_name
						fulltext value_q, :fields => :sub_category_name
						fulltext value_q, :fields => :sub_sub_category_name
					end
					
					search_qry['search'] = value_q
					
				end
			end
				
			paginate :page => params[:page], :per_page => 12
			order_by :created_at, :desc
		end
			
		
		@equipments = search.results
		
		if current_user
			if !search_qry.empty?
				
				history_data = SearchHistory.where('search_histories.user_id = ? AND search_histories.search = ?', current_user.id, search_qry.to_json).first	
				
				if !history_data		
				
					SearchHistory.create(user_id: current_user.id, search: search_qry.to_json)
				
				end
				
			end
		end
		
		#abort(search_qry.to_json)
		#abort(@equipments.to_json)
		
		render :index
	end
	
	def add_favourite
	
		favorite_data = Favorite.where('favorites.user_id = ? AND favorites.equipment_id = ?', current_user.id, params[:equipment_id]).first
	
		if favorite_data
			render json: {message: 'Already in favourite !', status: '201'}
		else
			Favorite.create(user_id: current_user.id, equipment_id: params[:equipment_id])
			
			render json: {message: 'Equipment successfully added in favourite.', status: '200'}
			
		end
	
	end
	
	def remove_favourite
		Favorite.where(user_id: current_user.id, equipment_id: params[:equipment_id]).delete_all
		render json: {message: 'Equipment successfully removed from favourite.', status: '200'}
	end

	private
		def filter_params
			params.require(:filter).permit(:country_id, :manufacturer_id, :manufacture_year, :manufacturer_id,:category_id, :sub_category_id, :sub_sub_category_id)
		end

		def find_associated_data
			@top_bar_ad = Advertisement.where(:active => 1).find_by_page_reference('listing top horizontal').try(:image).try(:image).try(:ad_horizontal).try(:url)
			@left_panel_ad = Advertisement.where(:active => 1).find_by_page_reference('listing left panel').try(:image).try(:image).try(:ad_square).try(:url)
			@manufacturers = Manufacturer.joins(:equipments).distinct
			@countries = Country.active.joins(:equipments).distinct
			@categories = Category.active.all
			if Equipment.not_inactive.count > 0
				@manufacture_year_range = (Equipment.not_inactive.minimum('manufacture_year')..Equipment.not_inactive.maximum('manufacture_year')).to_a
			else
				@manufacture_year_range = nil
			end
			@recent_posts = Equipment.not_inactive.where("created_at > ? ", 30.days.ago).limit(12).order("created_at DESC")
		end
end
