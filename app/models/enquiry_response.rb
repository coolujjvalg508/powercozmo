class EnquiryResponse < ActiveRecord::Base
  enum status: { responded: 1, forwarded: 2 }

  belongs_to :equipment_enquiry
  belongs_to :user
  belongs_to :forwarded_user, :class_name => "AdminUser", :foreign_key => "forwarded_by" 

  validates :message, presence: true
  validates :message, length: { maximum: 3000,
    too_long: "Please enter maximum %{count} characters" }, :if => "message.present?"
	
	after_create :update_enquiry_read_by_admin
	after_create :send_enquiry_seller_response_email_to_admin , :if => Proc.new {|e| (e.status=="responded") }
	after_update :send_email_to_buyer_admin_approved_enquiry_seller_response , :if => Proc.new {|e| (e.status=="forwarded" && e.status_changed?) }

	def update_enquiry_read_by_admin
		equipment_enquiry.update_attribute(:read_by_admin, false)
	end

	def send_enquiry_seller_response_email_to_admin
		enquiry = equipment_enquiry		
		if status=="responded"
			case
			when enquiry.question? && enquiry.replied_as=='Accepted'
				EnquiryStatusMailer.delay.send_seller_answered_a_question_to_admin(enquiry,self)
			when (enquiry.buy? || enquiry.bid?) && enquiry.replied_as=='Accepted'
				EnquiryStatusMailer.delay.send_seller_accepted_an_offer_to_admin(enquiry,self)
			when (enquiry.buy? || enquiry.bid?) && enquiry.replied_as=='Rejected'
				EnquiryStatusMailer.delay.send_seller_rejected_an_offer_to_admin(enquiry,self)
			end
		end
	end

	def send_email_to_buyer_admin_approved_enquiry_seller_response
		enquiry = equipment_enquiry		
		if status=="forwarded"
			case
			when enquiry.question? && enquiry.replied_as=='Accepted'
				EnquiryStatusMailer.delay.forward_seller_answered_a_question_to_buyer(enquiry,self)
			when enquiry.bid? && enquiry.replied_as=='Accepted'
				EnquiryStatusMailer.delay.forward_seller_accepted_an_offer_to_buyer(enquiry,self)
			when enquiry.bid? && enquiry.replied_as=='Rejected'
				EnquiryStatusMailer.delay.forward_seller_rejected_an_offer_to_buyer(enquiry,self)
			when enquiry.buy? && enquiry.replied_as=='Accepted'
				EnquiryStatusMailer.delay.forward_seller_accepted_buying_order_to_buyer(enquiry,self)
			when enquiry.buy? && enquiry.replied_as=='Rejected'
				EnquiryStatusMailer.delay.forward_seller_rejected_buying_order_to_buyer(enquiry,self)
			end
		end
	end

end
