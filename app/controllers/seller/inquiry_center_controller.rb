class Seller::InquiryCenterController < Seller::BaseController
		
	def index

		conditions = "equipment_enquiries.enquiry_type  IN (1,2,3) AND (equipment.user_id = #{current_user.id} OR equipment_enquiries.user_id = #{current_user.id}) "

		if params[:status].present?
			conditions += " AND equipment_enquiries.replied_as = #{params[:status]} "
		end

		if params[:search].present?
			
			if params[:search] != ''
				conditions += " AND ( equipment.name like '%#{params[:search]}%' OR equipment.identifier like '%#{params[:search]}%' )"
			end
		
		end

		@result = EquipmentEnquiry.joins(:equipment).where(conditions).approved.order("created_at DESC").page(params[:page]).per(10)
		
		#testing query
		#@result = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type  IN (?) ", [1,2,3]).approved.order("created_at DESC").page(params[:page]).per(10)

	end

	def detail

		@result = EquipmentEnquiry.joins(:equipment).where("(equipment.user_id = #{current_user.id} OR equipment_enquiries.user_id = #{current_user.id}) AND equipment_enquiries.id = ?", params[:id]).approved.order("created_at DESC").first

		if !@result.present?
			flash[:error] = "invalid Inquiry!"	
			redirect_to seller_inquiry_center_path
		end

		@countries = Hash[Country.active.pluck(:id, :name)]

		if "question" == @result.enquiry_type
			price = @result.equipment.price
		else 
			price = @result.bidding_price
		end	

		@commission = Commission.for_price(price).first.to_f
		if @commission == 0.0
			@commission = Commission.order("max_price DESC").first.percent.to_f
		end

		if @result.order.present? 
			@total_amount = @result.order.price 
			@commission_val = (@total_amount * @result.order.commission) / 100 
			@seller_amount = @total_amount - @commission_val 
		else 
			if "question" == @result.enquiry_type
			@total_amount = @result.equipment.price
		else 
			@total_amount = @result.bidding_price
		end 
			@commission_val = (@total_amount * @commission) / 100
			@seller_amount = @total_amount - @commission_val
		end
		
	end

	def delete_inquiry

		if params[:inquiry_data].present?

			params[:inquiry_data].each do |enquipment_enquiry_id|

				EquipmentEnquiry.where(id: enquipment_enquiry_id).delete_all
				Order.where(equipment_enquiry_id: enquipment_enquiry_id).delete_all
				EnquiryResponse.where(equipment_enquiry_id: enquipment_enquiry_id).delete_all

			end

		end

		flash[:notice] = "Inquiry deleted successfully."	
		result = ['success']
		render :json => result, status: 200

	end

	def mark_unread_inquiry

		if params[:inquiry_data].present?
			EquipmentEnquiry.where('id in (?)', params[:inquiry_data]).update_all(:is_read => false)
		end

		flash[:notice] = "Inquiry marked unread successfully."	
		result = ['success']
		render :json => result, status: 200

	end

	def reject_inquiry

		if params[:inquiry_data].present?
			EquipmentEnquiry.where('id in (?)', params[:inquiry_data]).update_all(:replied_as => 3)
		end

		flash[:notice] = "Inquiry rejected successfully."	
		result = ['success']
		render :json => result, status: 200

	end

	def report_spam_inquiry

		if params[:inquiry_data].present?
			EquipmentEnquiry.where('id in (?)', params[:inquiry_data]).update_all(:is_spam => 1)
		end

		flash[:notice] = "Inquiry reported as spam successfully."	
		result = ['success']
		render :json => result, status: 200

	end

	def add_user_contact

		if params[:contact_data].present?
			params[:contact_data].each do |contact_user_id|
				UserContact.where(user_id: current_user.id, contact_user_id: contact_user_id).delete_all
				UserContact.create(user_id: current_user.id, contact_user_id: contact_user_id)
			end
		end

		flash[:notice] = "Partner added to contact successfully."	
		result = ['success']
		render :json => result, status: 200

	end

	def save_shipping_inquiry
    
		if params[:commit] == 'Update'
	  
			equipment_enquiry = EquipmentEnquiry.find_by(id: params[:id])

			@order = Order.find_by(equipment_enquiry_id: params[:id])
      		  
			if @order
				order_id = @order.id
			else
				order_id = 0
			end
			
			if params[:equipment][:update_type] == 'seller'
			
				i = 0
				shipping_package = params[:equipment][:shipping_package]

				if shipping_package
					shipping_package.each_with_index do |s_package, index| 
						#abort(s_package[1][:width].to_json)
						
						length = s_package[1][:length]
						width = s_package[1][:width]
						height = s_package[1][:height]
						weight = s_package[1][:weight]
						
						if length != '' || width != '' || height != '' || weight != ''
							if i == 0
								ShippingPackage.where(equipment_id: equipment_enquiry.equipment_id).delete_all
							end
							ShippingPackage.create(order_id: order_id, equipment_id: equipment_enquiry.equipment_id, length: length, width: width, height: height, weight: weight)
							i = i + 1
						end
					end
				end
			
			    if i > 0

			    	equipment = Equipment.find_by(id: equipment_enquiry.equipment_id)
					equipment.update(country_id: params[:equipment][:country_id], city: params[:equipment][:city], pickup_port: params[:equipment][:pickup_port])

					if @order
						@order.update(no_of_packages: i, pickup_country_id: params[:equipment][:country_id], pickup_city: params[:equipment][:city], pickup_port: params[:equipment][:pickup_port])
					end
					
					flash[:notice] = "Successfully updated."
					redirect_to seller_detail_inquiry_center_path(params[:id])
					
				else
				
					flash[:error] = "Failed, Enter atlease one shipping package detail!"
					redirect_to seller_detail_inquiry_center_path(params[:id])
				
				end
			
			elsif params[:equipment][:update_type] == 'buyer'
		
				equipment_enquiry.update(shipping_method: params[:equipment_enquiry][:shipping_method], country_id: params[:equipment_enquiry][:country_id], delivery_city: params[:equipment_enquiry][:delivery_city], delivery_port: params[:equipment_enquiry][:delivery_port])

				if @order
					@order.update(shipping_method: params[:equipment_enquiry][:shipping_method], delivery_country_id: params[:equipment_enquiry][:country_id], delivery_city: params[:equipment_enquiry][:delivery_city], delivery_port: params[:equipment_enquiry][:delivery_port])
				end
				
				flash[:notice] = "Successfully updated."
				redirect_to seller_detail_inquiry_center_path(params[:id])
				
			else
				flash[:error] = "Invalid action!"
				redirect_to seller_detail_inquiry_center_path(params[:id])		
				
			end
			
	  	else
			flash[:error] = "Invalid action!"
			redirect_to seller_detail_inquiry_center_path(params[:id])
	  	end
	  
  	end

  	def inquiry_update_contact

		if params[:commit] == 'UpdateContact'
			@user = Profile.find_by(user_id: params[:user_id])
			if @user.update(first_name: params[:user][:profile_attributes][:first_name], last_name: params[:user][:profile_attributes][:last_name], company_name: params[:user][:profile_attributes][:company_name], phone_number: params[:user][:profile_attributes][:phone_number])
			
				flash[:notice] = "Contact detail successfully updated."
				redirect_to seller_detail_inquiry_center_path(params[:id])
			else
				err_msg = ''
				attrb = []
				i = 0
				@user.errors.each do |attribute, message|
					if !attrb.include?(attribute)
						attrb[i] = attribute
				    	err_msg = err_msg.to_s + message.to_s + '<br/>'
				    	i = i + 1
					end
				end
				flash[:error] = err_msg
				redirect_to seller_detail_inquiry_center_path(params[:id])
			end		
		else
			flash[:error] = "Invalid action!"
			redirect_to seller_detail_inquiry_center_path(params[:id])
		end  
	end

	def make_offer
		@enquiry = EquipmentEnquiry.find_by(id: params[:id])

		if @enquiry.update(bidding_price: params[:equipment_enquiry][:bidding_price], offered_by_user_id: current_user.id, enquiry_type: 2, replied_as: 1)
		
			flash[:notice] = "Offer sent successfully."
			redirect_to seller_detail_inquiry_center_path(params[:id])
		else
			err_msg = ''
			attrb = []
			i = 0
			@user.errors.each do |attribute, message|
				if !attrb.include?(attribute)
					attrb[i] = attribute
			    	err_msg = err_msg.to_s + message.to_s + '<br/>'
			    	i = i + 1
				end
			end
			flash[:error] = err_msg
			redirect_to seller_detail_inquiry_center_path(params[:id])
		end	
	end

end
