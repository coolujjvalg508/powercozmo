class BuyingRequestMoreDetail < ActiveRecord::Base
	include Bootsy::Container
	mount_uploader :attachment, AttachmentUploader

	########################### Associations ###########################
	belongs_to :user
	belongs_to :buying_request
	accepts_nested_attributes_for :user

	########################## Validations ################################
	validates	:receiver, presence: {message: "Receiver can't be blank"}
	validates	:user_id, presence: {message: "User can't be blank"}
	validates	:subject, presence: {message: "Subject can't be blank"}
	validates	:message, presence: {message: "Message can't be blank"}

	########################### Scopes #############################
	scope :unread, -> { where(is_read: false) }
  scope :read_by_admin, -> { where("#{BuyingRequestMoreDetail.table_name}.read_by_admin = ? AND #{BuyingRequestMoreDetail.table_name}.response_read_by_admin = ?", true,true) }
  scope :unread_by_admin, -> { where("#{BuyingRequestMoreDetail.table_name}.read_by_admin = ? OR (#{BuyingRequestMoreDetail.table_name}.status IS NOT NULL AND #{BuyingRequestMoreDetail.table_name}.response_read_by_admin = ?)", false,false) }

	######################### Callbacks ##############################
	after_create :update_buying_request_read_by_admin, :send_email_to_admin_rfi_submission_by_seller, :send_email_to_seller_after_submission_of_rfi
	after_update :send_admin_approved_rfi_email_to_buyer , :if => Proc.new {|e| e.status=="Approved" && e.status_changed?}

	def update_buying_request_read_by_admin
		buying_request.update_attribute(:read_by_admin, false)
		#to update updated_at coulmn in case read_by_admin was already false
		buying_request.touch
	end

	def send_email_to_admin_rfi_submission_by_seller
    BuyingRequestMoreDetailMailer.delay.send_email_to_admin_rfi_submission_by_seller(self)
	end

	def send_email_to_seller_after_submission_of_rfi
    BuyingRequestMoreDetailMailer.delay.send_email_to_seller_after_submission_of_rfi(self)
	end

	def send_admin_approved_rfi_email_to_buyer
		BuyingRequestMoreDetailMailer.delay.send_admin_forwarded_rfi_email_to_buyer(self)
	end

end

##########################  Schema Information ##############################

# create_table "buying_request_more_details", force: :cascade do |t|
#   t.string   "receiver",          limit: 255
#   t.string   "subject",           limit: 255
#   t.text     "message",           limit: 65535
#   t.string   "attachment",        limit: 255
#   t.integer  "user_id",           limit: 4
#   t.integer  "buying_request_id", limit: 4
#   t.string   "status",            limit: 255
#   t.datetime "created_at",                      null: false
#   t.datetime "updated_at",                      null: false
# end