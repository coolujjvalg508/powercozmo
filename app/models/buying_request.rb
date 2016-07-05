class BuyingRequest < ActiveRecord::Base
  ########### Default per page  value for pagination ####
  paginates_per 10
  ########################## Uploaders ######################

	mount_uploader :attachment, PdfAttachmentUploader
	mount_uploader :image, ImageUploader
  ######################### Constants #########################

	LEAD_TYPES = ['Supplying', 'Overhaul', 'Power purchase', 'Turnkey']
	CONDITIONS = ['New', 'Used', 'Refurbished']
	ORIGINS = {0 => 'USA', 1 => 'Russia', 2 => 'China', 3 => 'Europe'}
  STATUS = ['New', 'Accepted', 'Rejected', 'Closed'] # Approved -> only for admin
  ########################### Associations #######################

	belongs_to :category
  has_many :buying_proposals, dependent: :destroy
  has_many :buying_request_more_details, dependent: :destroy
	belongs_to :location, :class_name => "Country", :foreign_key => "location_id"
	belongs_to :country, :class_name => "Country", :foreign_key => "country_id"
	belongs_to :brand, :class_name => "Manufacturer", :foreign_key => "brand_id"
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? || attributes['image'].nil? }, allow_destroy: true


  ############################# Validations ###########################

	validates	:title, presence: {message: "Title can't be blank"}
  # validates :origin_id, presence: {message: "Origin can't be blank"}
  # validates :brand_id, presence: {message: "Brand can't be blank"}
  validates :category_id, presence: {message: "Category can't be blank"}, if: "category_name.blank?"
  validates :category_name, presence: {message: "Category can't be blank"}, if: "category_id.present? && category_id == 0"
  validates :lead_type, presence: {message: "Lead type can't be blank"}
  validates :condition, presence: {message: "Condition can't be blank"}
  validates :expiration_date, presence: {message: "Exipration date can't be blank"}
  # validates :image, presence: {message: "Image can't be blank"}
  validates :description, presence: {message: "Description can't be blank"}
  validates :name, presence: {message: "Name can't be blank"}
  validates :email, presence: {message: "Email can't be blank"}
  validates :mobile, presence: {message: "Mobile can't be blank"}
  validates :country_id, presence: {message: "Country can't be blank"}
  validates :company_name, presence: {message: "Company name can't be blank"}
  validates :company_website, presence: {message: "Company website can't be blank"}
  validates :company_website, format: {with: /\A((http|https):\/\/|www[.])[^\s()<>]+[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i, message: "Please enter a valid website" }, :if => "company_website.present?"
  validates :address, presence: {message: "Address can't be blank"}
	validates_format_of :email, :with  => Devise.email_regexp
  validates :mobile, format: {with: /\A[\+]*[0-9\-]*\z/, :message => "Please enter a valid mobile number" }, :if => "mobile.present?"
  validates_length_of :mobile, :minimum => 10, :maximum => 18, too_short: "Must have at least %{count} digits", too_long: "Must have at most %{count} digits", :if => "mobile.present?"
  validates :city, :format => { :with => /\A[a-zA-z\s-]+\z/, :message => "City is not valid." }, if: "city.present?"

  ########### Scopes ###############
  scope :approved,-> { where(status: 'Approved') }
  scope :read, -> { where(is_read: true) }
  scope :unread, -> { where(is_read: false) }
  scope :read_by_admin, -> { where("#{BuyingRequest.table_name}.read_by_admin = ? AND #{BuyingRequest.table_name}.response_read_by_admin = ?", true,true) }
  scope :unread_by_admin, -> { where("#{BuyingRequest.table_name}.read_by_admin = ? OR (#{BuyingRequest.table_name}.status IS NOT NULL AND #{BuyingRequest.table_name}.response_read_by_admin = ?)", false,false) }

  ############## Call Backs ###########################
  after_initialize :next_identifier, unless: :persisted?
  after_create :send_posted_buying_request_email_to_admin, :send_posted_buying_request_email_to_buyer
  after_update :send_admin_approved_buying_request_email_to_buyer , :if => Proc.new {|e| e.status=="Approved" && e.status_changed?}


  def self.search(q = {})
  	if q.present?
  		cond = "description LIKE '%#{q}%' OR title LIKE '%#{q}%'"
  		where(cond)
		else
			all
  	end
  end

  def more_info_requests
    buying_request_more_details
  end

  def next_identifier
    e = BuyingRequest.last
    self.identifier = e.nil? ? 'SN-0000001' : e.identifier.to_s.succ
  end

  def is_read_by_admin?
    (read_by_admin? && !status.nil? && response_read_by_admin?) || (read_by_admin? && status.nil?)
  end

  def mark_as_read(user)
    if user.class.name=="AdminUser"
      self.update_attribute(:read_by_admin, true) unless read_by_admin?
      self.update_attribute(:response_read_by_admin, true) if status.present? && !response_read_by_admin?
      self.buying_proposals.update_all(:read_by_admin => true) if self.buying_proposals.map(&:read_by_admin?).include?false
      self.buying_proposals.update_all(:response_read_by_admin => true) if self.buying_proposals.map(&:response_read_by_admin?).include?false
      self.buying_request_more_details.update_all(:read_by_admin => true) if self.buying_request_more_details.map(&:read_by_admin?).include?false
      self.buying_request_more_details.update_all(:response_read_by_admin => true) if self.buying_request_more_details.map(&:response_read_by_admin?).include?false
    end
  end

  def send_posted_buying_request_email_to_admin
    BuyingRequestMailer.delay.send_posted_buying_request_email_to_admin(self)
  end

  def send_posted_buying_request_email_to_buyer
    BuyingRequestMailer.delay.send_posted_buying_request_email_to_buyer(self)
  end

  def send_admin_approved_buying_request_email_to_buyer
    BuyingRequestMailer.delay.send_admin_approved_buying_request_email_to_buyer(self)
  end

  def send_admin_approved_buying_request_email_to_seller
    BuyingRequestMailer.delay.send_admin_approved_buying_request_email_to_seller(self)
  end

  def send_email_to_seller_about_near_to_expire_buying_request
    BuyingRequestMailer.delay.send_email_to_seller_about_near_to_expire_buying_request(self)
  end

  def send_email_to_admin_about_near_to_expire_buying_request
    BuyingRequestMailer.delay.send_email_to_admin_about_near_to_expire_buying_request(self)
  end

  def send_email_to_buyer_about_expiring_buying_request
    BuyingRequestMailer.delay.send_email_to_buyer_about_expiring_buying_request(self)
  end

end

################## Field SeT ####################
=begin
	create_table "buying_requests", force: :cascade do |t|
	  t.string   "title",           limit: 255
    t.integer  "origin_id",       limit: 4
    t.integer  "location_id",     limit: 4
    t.integer  "brand_id",        limit: 4
    t.integer  "category_id",     limit: 4
    t.string   "lead_type",       limit: 255
    t.string   "condition",       limit: 255
    t.date     "expiration_date"
    t.string   "attachment",      limit: 255
    t.string   "end_user",        limit: 255
    t.string   "city",            limit: 255
    t.string   "image",           limit: 255
    t.text     "description",     limit: 65535
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "mobile",          limit: 255
    t.integer  "country_id",      limit: 4
    t.string   "company_name",    limit: 255
    t.string   "company_website", limit: 255
    t.string   "address",         limit: 255
    t.string   "status",          limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
	end
=end
###################################################
