class Seller::EquipmentEnquiriesController < Seller::BaseController
	# Note: It seems below action not used any where, so commented it.
	# def index
	# 	@enquiries = EquipmentEnquiry.joins(:equipment).where("equipment.user_id = ?", current_user.id);
	# end
	
	def questions
		@questions = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type = ? AND (equipment.user_id = ? OR equipment_enquiries.user_id = ?)", 1, current_user.id, current_user.id).approved.order("created_at DESC").page(params[:page])
	end

	def offers
		#It fetches the both bids and buy requests
		@offers = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type IN (?) AND (equipment.user_id = ? OR equipment_enquiries.user_id = ?)", [2,3], current_user.id, current_user.id).approved.order("created_at DESC").page(params[:page])
	end

	def show_offer
		@offer = find_enquiry
		unless @offer.present?
			redirect_to seller_offers_path, notice: "Offer not found"
		end
	end

	def respond_to_offer
		@offer = find_enquiry
		
		#abort(@offer.to_json)
		#abort(@offer.equipment.to_json)
		#abort(@offer.equipment.shipping_package.to_json)
		
		#no_of_package = @offer.equipment.shipping_package.count
		
		#abort(no_of_package.to_s)
				
		if @offer.present?
			response = @offer.responses.new(user_id: current_user.id, message: enquiry_response_params[:message])
			if ["Accept","Reject"].include?(params[:commit])
				response_type = params[:commit]+"ed"  # to make it enum compatable like 'Accepted'
				if @offer.update(:response => enquiry_response_params[:message], :response_status => "Responded", :replied_as => response_type)
					response.save
					if @offer.replied_as == 'Accepted'
						order_params = [:name, :email, :mobile, :country_id, :company_website, :equipment_id].inject({}) do |params, element|
							params[element] = @offer[element]
							params
						end
						order_params[:status] = "Seller Confirmed"
						order_params[:price] = @offer.bidding_price
						order_params[:commission] = Commission.for_price(@offer.bidding_price).first.to_f
						if order_params[:commission] == 0.0
							order_params[:commission] = Commission.order("max_price DESC").first.percent.to_f
						end
						
						no_of_package = @offer.equipment.shipping_package.count
						order_params[:user_id] = @offer.user_id
						order_params[:equipment_enquiry_id] = @offer.id
						order_params[:no_of_packages] = no_of_package
						order_params[:shipping_method] = @offer.shipping_method
						order_params[:pickup_country_id] = @offer.equipment.country_id
						order_params[:pickup_city] = @offer.equipment.city
						order_params[:pickup_port] = @offer.equipment.pickup_port
						order_params[:delivery_country_id] = @offer.country_id
						order_params[:delivery_city] = @offer.delivery_city
						order_params[:delivery_port] = @offer.delivery_port
								
						order = Order.new(order_params)
						if order.save
							eq = @offer.equipment
							eq.status = 'sold'
							eq.save
							
							if no_of_package > 0								
								ShippingPackage.where(equipment_id: @offer.equipment_id).update_all(order_id: order.id)
							end
						end
					end
					flash[:notice] = "Offer #{response_type.downcase} successfully"
				else
					flash[:alert] = "Failed to process request, please try again."
				end
			else
				if @offer.update(:response => enquiry_response_params[:message])
					flash[:notice] = "Message sent successfully."
				else
					# flash[:alert] = "Failed to process request, please try again."
					if @offer.errors.messages[:responses][0] == "is invalid"
						@error = "Please enter maximum 3000 characters"
					end
					render :show_offer and return
				end
			end
		else
			flash[:alert] = "Offer not found"
		end
		redirect_to seller_offers_path
	end

	def show_question
		@question = find_enquiry
		unless @question.present?
			redirect_to seller_questions_path, notice: "Question not found"
		end
	end

	def reply_to_question
		@question = find_enquiry
		if @question.present?
			response = @question.responses.new(user_id: current_user.id, message: enquiry_response_params[:message])
			if @question.update(:response => enquiry_response_params[:message], :response_status => "Responded", :replied_as => "Accepted")
					if response.save
						flash[:notice] = "Message sent successfully."
					else
						@error = response.errors.full_messages[0]
					end
			else
				if @question.errors.messages[:responses]
					@error = @question.responses.last.errors.full_messages[0]
				else
					@error = @question.errors.full_messages[0]
				end
			end
			render :action => :show_question and return if @error.present?
		else
			flash[:notice] = "Question not found"
		end
		redirect_to seller_questions_path
	end

	def destroy
		@enquiry = find_enquiry
		if @enquiry.destroy
			flash[:notice] = "Deleted successfully"
		else
			flash[:notice] = "Failed to delete"
		end
		redirect_to :back
	end

	def unread
		@notifications = current_user.equipment_enquiries.approved.unread.limit(15)
    respond_to do |format|
      format.js
    end
  end

	private

	def find_enquiry
		enquiry = EquipmentEnquiry.approved.find_by_id params[:id]
		if current_user.present? && enquiry.present?
			enquiry.mark_as_read(current_user) unless enquiry.is_read?
		end
		enquiry
	end

	def enquiry_response_params
		params.require(:enquiry_response).permit(:message)
	end
end
