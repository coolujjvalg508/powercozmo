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

		flash[:notice] = "User added to contact successfully."	
		result = ['success']
		render :json => result, status: 200

	end

end
