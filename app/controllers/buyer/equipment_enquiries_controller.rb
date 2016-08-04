class Buyer::EquipmentEnquiriesController < Buyer::BaseController
	# Note: It seems below action not used any where, so commented it.
	# def index
	# 	@enquiries = EquipmentEnquiry.joins(:equipment).where("equipment.user_id = ?", current_user.id);
	# end

	def questions
		@questions = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type = ? AND equipment_enquiries.email = ?", 1, current_user.email).approved.order("created_at DESC").page(params[:page])
	end

	def offers
		#It fetches the both bids and buy requests
		@offers = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type IN (?) AND equipment_enquiries.email = ?", [2,3], current_user.email).approved.order("created_at DESC").page(params[:page])
	end

	def show_offer
		@offer = find_enquiry
		unless @offer.present?
			redirect_to buyer_offers_path, notice: "Offer not found"
		end
	end

	def respond_to_offer
		@offer = find_enquiry
		if @offer.present?
			response = @offer.responses.new(user_id: current_user.id, message: enquiry_response_params[:message])
			
			if @offer.update(:response => enquiry_response_params[:message])
				flash[:notice] = "Message sent successfully."
			else
				# flash[:alert] = "Failed to process request, please try again."
				if @offer.errors.messages[:responses][0] == "is invalid"
					@error = "Please enter maximum 3000 characters"
				end
				render :show_offer and return
			end
			
		else
			flash[:alert] = "Offer not found"
		end
		redirect_to buyer_offers_path
	end

	def show_question
		@question = find_enquiry
		unless @question.present?
			redirect_to buyer_questions_path, notice: "Question not found"
		end
	end

	def reply_to_question
		@question = find_enquiry
		if @question.present?
			response = @question.responses.new(user_id: current_user.id, message: enquiry_response_params[:message])
			if @question.update(:response => enquiry_response_params[:message])
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
		redirect_to buyer_questions_path
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
