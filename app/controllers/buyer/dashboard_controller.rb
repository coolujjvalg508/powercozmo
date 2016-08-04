class Buyer::DashboardController < Buyer::BaseController
	def index
		@received_messages = current_user.mailbox.inbox.where.not("#{Mailboxer::Message.table_name}.sender_type = ? AND #{Mailboxer::Message.table_name}.sender_id = ?",current_user.class.name,current_user.id)
		@offers = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type IN (?) AND equipment.user_id = ?", [2,3], current_user.id).approved
		@questions = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type = ? AND equipment.user_id = ?", 1, current_user.id).approved

	end
end
