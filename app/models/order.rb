class Order < ActiveRecord::Base
	######################### Associations ########################
	belongs_to :equipment
	belongs_to :country
	belongs_to :user
	belongs_to :pickup_country, :class_name => "Country", :foreign_key => "pickup_country_id"
	belongs_to :delivery_country, :class_name => "Country", :foreign_key => "delivery_country_id"
	has_one :seller, through: :equipment, :source => :user
	has_many :shipping_package
	######################## Validations ##########################
	validates :price, presence: {message: "Price can't be blank"}
	validates :price, numericality: { :greater_than_or_equal_to => 0.1 }
	validates :name, presence: {message: "Name can't be blank"}
	validates :email, presence: {message: "Email can't be blank"}
	validates_format_of :email, :with  => /\A[^@\s]+@[^@\s]+\z/, :message => 'Please enter a valid email'
	validates :mobile, presence: {message: "Mobile number can't be blank"}
	validates :mobile, :numericality => {:only_integer => true}
	validates_length_of :mobile, :minimum => 10, :maximum => 11, too_short: "Must have at least %{count} digits", too_long: "Must have at most %{count} digits"
	validates :country_id, presence: {message: "Country can't be blank"}
	validates :company_website, presence: {message: "Company Website can't be blank"}
	validates :company_website, length: { maximum: 255, message: "Website can not be more that 255 character"}
	validates :commission, presence: {message: "Commission can't be blank"}
	validates :status, presence: {message: "Status can't be blank"}
	validates :no_of_packages, numericality: { only_integer: true }

	############################# Constants #######################
	SHIPPING_METHOD = ["Air fright", "Sea freight", "Land transportation"]
	STATUS = ["Seller Confirmed", "Request For Shipping", "Shipped To Buyer", "Buyer Confirmed", "Payment Done", "Completed", "Closed", "Order Cancelled"]
	
	############ Order Status #############
	
	#1.Waiting for buyer /seller confirmation.
	#2.Waiting for buyer payment.
	#4.Waiting for shipping.
	#5.Waiting for delivery confirmation.
	#6.Order cancel requested.
	#7. In dispute.
	#8.Completed 
	#9.Closed 
	
	#######################################
	
end

########################## Schema Information ########################

# create_table "orders", force: :cascade do |t|
#   t.integer  "equipment_id",    limit: 4,   null: false
#   t.float    "price",           limit: 24
#   t.string   "name",            limit: 255
#   t.string   "email",           limit: 255
#   t.string   "mobile",          limit: 255
#   t.integer  "country_id",      limit: 4
#   t.string   "company_name",    limit: 255
#   t.string   "company_website", limit: 255
#   t.float    "commission",      limit: 24
#   t.datetime "created_at",                  null: false
#   t.datetime "updated_at",                  null: false
# end

# add_index "orders", ["equipment_id"], name: "index_orders_on_equipment_id", using: :btree
