class BuyingProposal < ActiveRecord::Base
	########### Default per page  value for pagination ####
  paginates_per 10
	########################### constants ##################################
	DELIVERY_TIME = (1..3).collect { |week| week.to_s+" Week".pluralize(week)  }+(1..24).collect { |month| month.to_s+" Month".pluralize(month)  }
	########################### Associations ################################
	belongs_to :user
	has_one :image, as: :imageable, dependent: :destroy
	mount_uploader :attachment, AttachmentUploader
	belongs_to :buying_request
	belongs_to :currency
	accepts_nested_attributes_for :image
	accepts_nested_attributes_for :user

	############################ Validations #################################
	validates	:price, presence: {message: "Price can't be blank"}
	validates :price, numericality: { only_integer: false ,message: 'Please enter numbers.'}
	validates_format_of :price, :with  => /\A[0-9]{0,10}[\.]*[0-9]{0,2}\z/, :message => 'Max value for price is 9999999999.99'
	validates	:currency_id, presence: {message: "Currency can't be blank"}
	validates	:proposal, presence: {message: "Proposal can't be blank"}
	validates	:delivery_time, presence: {message: "Delivery time can't be blank"}

	############################ Scopes #######################################
	scope :read, -> { where(is_read: true) }
  scope :unread, -> { where(is_read: false) }
  scope :read_by_admin, -> { where("#{BuyingProposal.table_name}.read_by_admin = ? AND #{BuyingProposal.table_name}.response_read_by_admin = ?", true,true) }
  scope :unread_by_admin, -> { where("#{BuyingProposal.table_name}.read_by_admin = ? OR (#{BuyingProposal.table_name}.status IS NOT NULL AND #{BuyingProposal.table_name}.response_read_by_admin = ?)", false,false) }

	############################## Callbacks #################################
	after_create :update_buying_request_read_by_admin, :send_email_to_admin_proposal_submission_by_seller, :send_email_to_seller_after_submission_of_proposal
	after_update :send_admin_approved_buying_proposal_emails , :if => Proc.new {|e| e.status=="Approved" && e.status_changed?}

	def update_buying_request_read_by_admin
		buying_request.update_attribute(:read_by_admin, false)
		#to update updated_at coulmn in case read_by_admin was already false
		buying_request.touch
	end

	def send_email_to_admin_proposal_submission_by_seller
    BuyingProposalMailer.delay.send_email_to_admin_proposal_submission_by_seller(self)
	end

	def send_email_to_seller_after_submission_of_proposal
    BuyingProposalMailer.delay.send_email_to_seller_after_submission_of_proposal(self)
	end

	def send_admin_approved_buying_proposal_emails
		BuyingProposalMailer.delay.send_admin_approved_buying_proposal_email_to_seller(self)
		BuyingProposalMailer.delay.send_admin_forwarded_buying_proposal_email_to_buyer(self)
	end
end

##############################  Schema Information ##############################

# create_table "buying_proposals", force: :cascade do |t|
#   t.text     "proposal",          limit: 65535
#   t.float    "price",             limit: 24
#   t.datetime "delivery_time"
#   t.string   "currency",          limit: 255,   default: ""
#   t.integer  "buying_request_id", limit: 4
#   t.integer  "user_id",           limit: 4
#   t.string   "status",            limit: 255
#   t.datetime "created_at",                                   null: false
#   t.datetime "updated_at",                                   null: false
# end
