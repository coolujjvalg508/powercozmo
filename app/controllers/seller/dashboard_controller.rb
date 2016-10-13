class Seller::DashboardController < Seller::BaseController
	
	def index
		@equipments = current_user.equipment.all.order('created_at desc').page(params[:page]).per(10)
		@buying_requests = BuyingRequest.approved
		@received_messages = current_user.mailbox.inbox.where.not("#{Mailboxer::Message.table_name}.sender_type = ? AND #{Mailboxer::Message.table_name}.sender_id = ?",current_user.class.name,current_user.id)
		@offers = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type IN (?) AND (equipment.user_id = ? OR equipment_enquiries.user_id = ?)", [2,3], current_user.id, current_user.id).approved.order("created_at DESC")
		@proposals = current_user.buying_proposals
		@questions = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type = ? AND equipment.user_id = ?", 1, current_user.id).approved
		@orders = Order.all.order('created_at desc').joins(:equipment).where('equipment.user_id = ? OR orders.user_id = ? ', current_user, current_user)
		
	end
end
