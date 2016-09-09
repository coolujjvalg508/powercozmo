class WelcomeController < ApplicationController

	def index
		@categories = Category.active.roots
		@latest_ads = Equipment.where("created_at > ? ", 30.days.ago).active.order('created_at DESC').limit(12)
		@popular_ads = Equipment.popular.limit(12)
		@random_ads = Equipment.random.limit(12)
		@banner_url = Banner.where(:status => 1).limit(1).order('created_at DESC').first.try(:image).try(:image)
		@banner_url = 'assets/banner-bg.jpg' unless @banner_url
		@commissions = Commission.all.order("percent desc")		
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
		#@our_team = OurTeam.joins("LEFT JOIN images ON images.imageable_id = our_teams.id AND images.imageable_type = 'OurTeam'").where(active: true).select('our_teams.*', 'images.image')
		@our_team = OurTeam.joins(:image).where(active: true).select('our_teams.*', 'images.image')
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
	
	def send_newsletter
	
		search_history = SearchHistory.where('search_histories.search != ""')
		
		if search_history
		
			users = {}
	
			search_history.each do |v|		
				
				if !users[v.user_id]
					users[v.user_id] = Array.new
				end
				users[v.user_id].push(v.search.to_s)
			end
		
			#abort(users.to_json)
			last_sent_newsletters = SentNewsletter.order("id DESC").first
				
			##################	
			#abort(last_sent_newsletters.created_at.to_s)	
						
			#last_search_time = last_sent_newsletters.created_at.to_s
			#last_search_time = Date.parse(last_search_time).strftime('%Y-%m-%d %H')			
				#abort(last_search_time)		
				
				#equipment_result = Equipment.available_for_purchase.where('equipment.created_at > ?', last_search_time)
				
				#abort(equipment_result.to_json)		
				
			############################			
						
			users.each_with_index do |value, key|
		
				search_query = ''
				
				user_id = value.shift.to_s
				
				if last_sent_newsletters
				
					last_search_time = last_sent_newsletters.created_at.to_s
							
				else
				
					last_search = SearchHistory.where('search_histories.search != "" AND search_histories.user_id = ?', user_id).order("id DESC").first
					
					last_search_time = last_search.created_at.to_s
					
				end
				
				last_search_time = Date.parse(last_search_time).strftime('%Y-%m-%d %H:%M:%S')
								
				search_arr = value.slice(0)
				
				#abort(search_arr.to_json)
				j = 0
				search_arr.each do |v|
				
					if j > 0
						search_query =	search_query + ' OR '
					end
					#abort(v.to_json)
					sub_search_query = ''
					final_arr = JSON.parse(v)
					
					#abort(final_arr.to_json)
					i = 0
					final_arr.each_with_index do |v1, key1|
					
						if i > 0
							sub_search_query =	sub_search_query + ' AND '
						end
					
						if v1[0] == 'search'
						
							sub_search_query =	sub_search_query + ' (equipment.name LIKE "' + v1[1] + '" OR equipment.description LIKE "' + v1[1] + '" OR countries.name LIKE "' + v1[1] + '" OR categories.name LIKE "' + v1[1] + '" OR manufacturers.name = "' + v1[1] + '")'
						
						else
							sub_search_query =	sub_search_query + ' equipment.' + v1[0] + ' = ' + v1[1]
						end
						
						#abort(v1[0].to_s)
						i = i + 1
					end
					search_query =	search_query + '(' + sub_search_query + ')'
				
					j = j + 1
					#abort(v.to_s)
					#abort(sub_search_query)
				end
				
				abort(search_query)
				#abort(search_arr.to_json)
				
				equipment_result = Equipment.available_for_purchase.joins(:country, :manufacturer, :category, :user).where('equipment.user_id != ? AND equipment.created_at > ? AND ' + search_query, user_id, last_search_time)
				abort(equipment_result.to_json)
				if !equipment_result.empty?
				
					# Tell the NewsletterMailer to send a email
					
					user_data = User.find_by_id(user_id)
        
					a = NewsletterMailer.send_newsletter(user_data, equipment_result).deliver_now
					#abort(a.to_json)
				
					SentNewsletter.create(user_id: user_id)
										
				end
				
	
				#abort(equipment_result.to_json)
				
				#abort(last_search_time)
				#abort(value.to_json)
			
			end
			
			
		end
						
		#abort(search_history.to_json)
		abort('Ok')
			
	end

	private

		def contact_params
			params.require(:contact).permit(:first_name, :last_name, :email, :phone,:subject, :message)
		end

		def equipment_enquiry_params
			params.require(:enquiry).permit(:name, :email, :mobile, :country_id, :enquiry_type, :equipment_id, :company_name, :company_website, :message, :bidding_price, :user_id)
		end
end
