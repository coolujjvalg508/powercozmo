class Seller::DashboardController < Seller::BaseController
	
	def index
		@equipments = current_user.equipment.all.order('created_at desc').limit(4)
		@buying_requests = BuyingRequest.approved.order("created_at DESC")
		@received_messages = current_user.mailbox.inbox.where.not("#{Mailboxer::Message.table_name}.sender_type = ? AND #{Mailboxer::Message.table_name}.sender_id = ?",current_user.class.name,current_user.id)
		@offers = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type IN (?) AND (equipment.user_id = ? OR equipment_enquiries.user_id = ?)", [2,3], current_user.id, current_user.id).approved.order("created_at DESC")
		@proposals = current_user.buying_proposals
		@questions = EquipmentEnquiry.joins(:equipment).where("equipment_enquiries.enquiry_type = ? AND equipment.user_id = ?", 1, current_user.id).approved
		@orders = Order.all.order('created_at desc').joins(:equipment).where('equipment.user_id = ? OR orders.user_id = ? ', current_user, current_user)
		
		@received_proposals = BuyingProposal.joins(:buying_request).where('(buying_requests.user_id = ? OR buying_requests.email = ?)', current_user, current_user.email)
										
		@page_content_data = PageContentManagement.where(:page_url => "user_dashboard")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end	
				
	end
	
	def ask_for_services
		@ask_for_services = StaticPage.where(:url => "ask_for_services")
	end
	
end
