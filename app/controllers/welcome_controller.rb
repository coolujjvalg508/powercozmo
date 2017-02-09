class WelcomeController < ApplicationController

	def index
		@categories = Category.active.roots
		@latest_ads = Equipment.where("created_at > ? ", 30.days.ago).active.order('created_at DESC').limit(3)
		@popular_ads = Equipment.popular.limit(3)
		@random_ads = Equipment.random.limit(3)
		@banner_url = Banner.where(:status => 1).limit(1).order('created_at DESC').first.try(:image).try(:image)
		@banner_url = 'assets/banner-bg.jpg' unless @banner_url
		@commissions = Commission.all.order("percent desc")
		
		@page_content_data = PageContentManagement.where(:page_url => "home")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end	
		#abort(@content_data['what_is_powercozmo'].to_s)
					
	end

	def new_contact
		@contact_static_data = StaticPage.where(:url => "contact_us")
		@contact = Contact.new
	end

	def create_contact
		@contact = Contact.new(contact_params)
	  	if @contact.save
	  		flash[:notice] = "Thank you for contacting Power Cozmo. Our customer team will respond to your enquiry as soon as possible."
	  		redirect_to :back
	  	else
	  		render 'new_contact'
	  	end
	end

	def faq
		@faqs = Faq.where(active: true)
	end

	def terms_and_conditions
		@terms_and_conditions = StaticPage.where(:url => "terms_and_conditions")
	end

	def about_us
	
		@about_us = StaticPage.where(:url => "about_us")
		#@our_team = OurTeam.joins("LEFT JOIN images ON images.imageable_id = our_teams.id AND images.imageable_type = 'OurTeam'").where(active: true).select('our_teams.*', 'images.image')
		@our_team = OurTeam.joins(:image).where(active: true).select('our_teams.*', 'images.image')
		
		@page_content_data = PageContentManagement.where(:page_url => "about_us")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end	
		
	end

	def why_us
		@why_power_cozmo = StaticPage.where(:url => "why_power_cozmo")
	end

	def user_agreement
		@user_agreement = StaticPage.where(:url => "user_agreement")
	end

	def our_services
		@our_service = StaticPage.where(:url => "our_service")
	end

	def how_we_work
		@how_we_work = StaticPage.where(:url => "how_we_work")
	end

	def our_policy
		@our_policy = StaticPage.where(:url => "our_policy")
	end

	def good_to_know
		@good_to_knows = GoodToKnow.where(active: true)
	end

	def country_frequency
		@country_frquency = StaticPage.where(:url => "country_frequency")
	end

	def create_equipment_enquiry
		@equipment_enquiry = EquipmentEnquiry.new(equipment_enquiry_params)
		@equipment_enquiry[:bidding_price] = @equipment_enquiry.equipment.price if @equipment_enquiry.enquiry_type == "buy"
		if @equipment_enquiry.save
			render json: {:status => true}
		else
			render json: {errors: @equipment_enquiry.errors },:status => :error
		end
	end
	
	private

		def contact_params
			params.require(:contact).permit(:first_name, :last_name, :email, :phone,:subject, :message)
		end

		def equipment_enquiry_params
			params.require(:enquiry).permit(:name, :email, :mobile, :country_id, :enquiry_type, :equipment_id, :company_name, :company_website, :message, :bidding_price, :user_id, :shipping_method, :delivery_city, :delivery_port, :offered_by_user_id)
		end
end
