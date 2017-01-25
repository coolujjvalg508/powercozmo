class Seller::InquiryCenterController < Seller::BaseController
		
	def index

		@result = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type  IN (?) AND (equipment.user_id = ? OR equipment_enquiries.user_id = ?)", [1,2,3], current_user.id, current_user.id).approved.order("created_at DESC").page(params[:page]).per(10)

		#testing query
		#@result = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type  IN (?) ", [1,2,3]).approved.order("created_at DESC").page(params[:page]).per(10)

		#@orders = Order.all.order('created_at desc').joins(:equipment).where('equipment.user_id = ? OR orders.user_id = ? ', current_user, current_user).page(params[:page]).per(10)

		#abort(@result.to_json)

	end

end
