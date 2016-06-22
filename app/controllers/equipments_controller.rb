class EquipmentsController < ApplicationController
	before_action :find_associated_data, only: [:index, :filter]
	def index
		@equipments = Equipment.not_inactive.order('created_at desc').page params[:page]
	end

	def equipment_details
		@top_bar_ad = Advertisement.where(:active => 1).find_by_page_reference('listing details top horizontal').try(:image).try(:image).try(:ad_horizontal).try(:url)
		@side_panel_ad = Advertisement.where(:active => 1).find_by_page_reference('listing details right panel').try(:image).try(:image).try(:ad_square).try(:url)
		@equipment = Equipment.not_inactive.includes(:country, :manufacturer, :category, :user).find_by_id(params[:id])
		if @equipment
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