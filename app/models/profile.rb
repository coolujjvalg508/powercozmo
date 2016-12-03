class Profile < ActiveRecord::Base
	############################ Associations #############################

	belongs_to :user
	belongs_to :category
	belongs_to :country
	########################### Validations ################################

	validates :first_name, presence: {message: "First name can't be blank"}
	validates :last_name, presence: {message: "Last name can't be blank"}
	validates :phone_number, presence: {message: "Phone number can't be blank"}
	validates :company_name, presence: {message: "Company name can't be blank"}
	validates :country_id, presence: {message: "Country can't be blank"}
	validates :first_name, :last_name, length: { maximum: 35, message: "Please enter no more than 35 characters." }, format: {with: /\A(?!\d)[a-zA-Z0-9_\s]+\z/, message: "Please enter a valid name"}
	validates :company_name, length: { maximum: 50, message: "Please enter less then 50 characters." }
	validates :phone_number, format: {with: /\A[\+]*[0-9\-]*\z/}, :if => "phone_number.present?"
	validates_length_of :phone_number, :minimum => 10, :maximum => 18, too_short: "Must have at least %{count} digits", too_long: "Must have at most %{count} digits"
	# validates :website, presence: {message: "Website can't be blank"}
	validates :website, format: {with: /\A((http|https):\/\/|www[.])[^\s()<>]+[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/i, message: "Please enter a valid Website" }, :if => "website.present?"
	def name
		first_name.to_s+' '+last_name.to_s
	end
	
	############################ Constants ################################
  
	BUSINESS_TYPE = ["Agent", "Association", "Business Service", "Buying Office", "Distributor/Wholesaler", "Government ministry/Bureau/Commission", "Manufacturer ", "Trading Company", "Other"]
	
    ########################### Validations ################################

end

####################################  Schema Information ##############################

# create_table "profiles", force: :cascade do |t|
#   t.integer  "user_id",           limit: 4,     null: false
#   t.string   "first_name",        limit: 255
#   t.string   "last_name",         limit: 255
#   t.string   "company_name",      limit: 255
#   t.string   "phone_number",      limit: 255
#   t.string   "category",          limit: 255
#   t.string   "website",           limit: 255
#   t.text     "business_activity", limit: 65535
#   t.datetime "created_at",                      null: false
#   t.datetime "updated_at",                      null: false
# end

# add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree
