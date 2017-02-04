class EquipmentEnquiry < ActiveRecord::Base
	########### Default per page  value for pagination ####
  paginates_per 10
	############# Associations ###########
	belongs_to :country
	belongs_to :user
	belongs_to :equipment
	has_many :responses, :class_name => "EnquiryResponse", dependent: :destroy
	has_one :order
  ############ Scopes ##################
  scope :approved, -> { where(status: 2) }
  scope :unresponded, -> { where(response: nil) }
	scope :read, -> { where(is_read: true) }
	scope :unread, -> { where(is_read: false) }
	scope :read_by_admin, -> { where("#{EquipmentEnquiry.table_name}.read_by_admin = ?", true) }
	scope :unread_by_admin, -> { where("#{EquipmentEnquiry.table_name}.read_by_admin = ?", false) }
	############# Enums ##################
	enum status: { New: 1, Approved: 2, Disapproved: 3 }
	enum enquiry_type: {question: 1, bid: 2, buy: 3}
	#enum replied_as: {Requested: 1, Accepted: 2, Rejected: 3}
	enum replied_as: {'Negotiating': 1, 'Confirmed': 2, 'Rejected': 3, 'Funded to Power Cozmo': 4, 'Shipped': 5, 'Payment Released': 6, 'Full Protection': 7}

	enum response_status: {Responded: 1, Forwarded: 2}
	############# Validations ############
	validates :name, :email, :mobile, :country_id, :enquiry_type, :equipment_id, :company_name, :company_website, :message, presence: true
	validates :bidding_price, presence: true, if: "enquiry_type.present? && enquiry_type == 'bid'"
	validates :bidding_price, numericality: { only_integer: false ,message: 'Only accepts integer'}, if: "enquiry_type.present? && enquiry_type == 'bid'"
	validates_format_of :bidding_price, :with  => /\A[0-9]{0,10}[\.]*[0-9]{0,2}\z/, :message => "Bidding price can't be more then 9999999999.99", if: "enquiry_type.present? && enquiry_type == 'bid'"
	validates :name, length: { maximum: 35 }, if: "name.present?"
	validates_format_of :name, with: /\A(?!\d)[a-zA-Z0-9_\s]+\z/ , if: "name.present?"
	validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
	validates :mobile, format: {with: /\A[\+]*[0-9\-]*\z/}, :if => "mobile.present?"
	validates_length_of :mobile, :minimum => 10, :maximum => 18, too_short: "Must have at least %{count} digits", too_long: "Must have at most %{count} digits"
	validates :company_name, :company_website, length: {maximum: 100}
	validates :message, length: { maximum: 300 }, :if => "message.present?"

	############## ActiveRecord CallBacks ############
	after_create :send_enquiry_received_mail_to_buyer, :send_email_to_admin_posted_enquiry
	after_update :send_admin_approved_enquiry_email_to_seller , :if => Proc.new {|e| e.status=="Approved" && e.status_changed?}

	def self.get_enquiry_count_by_type(e_type, days_from)
		today = DateTime.now
		days_from = DateTime.now - days_from.to_i.days
		return select(:id).where(enquiry_type: e_type).where("created_at <= '#{today}' AND created_at >= '#{days_from}'").count
	end

	def self.get_date_range(days_from)
		today = Date.today.strftime("%Y-%m-%d")
		days_from = (Date.today - days_from.to_i.days).strftime("%Y-%m-%d")
		return {today: today, days_from: days_from}
	end

	def notification_message
		msg = ""
		case enquiry_type
		when 'bid'
			msg = 'You have recevied a bidding request'
		when 'buy'
			msg = 'You have recevied a buying request'
		when 'question'
			msg = 'You have recevied an Question'
		end
		msg
	end

	def is_read_by_admin?
		read_by_admin?
	end

	def mark_as_read(user)
		if equipment.try(:user_id) == user.try(:id)
			self.update_attribute(:is_read, true) unless is_read?
		end
		if user.class.name=="AdminUser"
			self.responses.update_all(is_read: true)
			self.update_attribute(:read_by_admin, true) unless read_by_admin?
			# self.update_attribute(:response_read_by_admin, true) if !response_status.nil? && !response_read_by_admin?
		end
	end

	def send_enquiry_received_mail_to_buyer
		case enquiry_type
		when 'bid'
			EnquiryStatusMailer.delay.send_posted_offer_to_buyer(self)
		when 'buy'
			EnquiryStatusMailer.delay.send_posted_buying_order_to_buyer(self)
		when 'question'
			EnquiryStatusMailer.delay.send_posted_question_to_buyer(self)
		end
	end

	def send_email_to_admin_posted_enquiry
		case enquiry_type
		when 'bid'
			EnquiryStatusMailer.delay.send_posted_offer_to_admin(self)
		when 'buy'
			EnquiryStatusMailer.delay.send_posted_buying_order_to_admin(self)
		when 'question'
			EnquiryStatusMailer.delay.send_posted_question_to_admin(self)
		end
	end

	def send_admin_approved_enquiry_email_to_seller
		if self.try(:Approved?)
			case enquiry_type
			when 'bid'
				EnquiryStatusMailer.delay.send_admin_approved_offer_to_seller(self)
			when 'buy'
				EnquiryStatusMailer.delay.send_admin_approved_buying_order_to_seller(self)
			when 'question'
				EnquiryStatusMailer.delay.send_admin_approved_question_to_seller(self)
			end
		end
	end

end
