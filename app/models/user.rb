class User < ActiveRecord::Base
  apply_simple_captcha

  acts_as_messageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :encryptable

  ############################ Associations #############################
  has_many :equipment, dependent: :destroy
  has_many :orders, through: :equipment
  has_one :profile, dependent: :destroy
  has_many :buying_proposals, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy
  has_many :equipment_enquiries, through: :equipment, dependent: :destroy
  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :image

  ############################ Constants ################################
  USERTYPE = ["Equipment Owner", "Equipment Broker-Dealer", "Trader", "Other"]
  enum role: { 'seller' => 1, 'admin' => 2}
  ########################### Validations ################################

  validates :email, confirmation: true
	validates :password, confirmation: true
	validates :email, presence: {message: "Email can't be blank"}
  validates :email, :email_confirmation, length: { maximum: 35, message: "Please enter no more than 35 characters." }
	validates :email_confirmation, presence: {message: "Email confirmation can't be blank"}, on: :create
  validates :email, uniqueness: {message: 'This email is already registered with us.'}
  validates_format_of :email, :with  => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => 'Please enter a valid email'
  validates_format_of :email_confirmation, :with  => /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, :message => 'Please enter a valid email', if: "email_confirmation.present?"
	validates :password, presence: {message: "Password can't be blank"}, on: :create
  validates :password_confirmation, presence: {message: "Password confirmation can't be blank"}, on: :create
  validates :terms_of_service, :acceptance => true
  validates :user_type, presence: {message: "I am can't be blank"}, on: :create

  ########################### Scopes ####################################
  scope :active, -> { includes(:profile).where(active: true).order(created_at: :desc) }
  scope :inactive, -> { includes(:profile).where(active: false).order(created_at: :desc) }

  ########################## Callbacks ################################
  before_save :add_role

  def active_for_authentication?
    super && self.active
  end

  def devise_mailer
    UserMailer
  end

  def name
    try(:profile).try(:first_name).to_s+' '+try(:profile).try(:last_name).to_s
  end

  def mailboxer_email(object)
    email
  end

  def unread_notifications_count
    equipment_enquiries.approved.unread.count
  end

  def add_role
    unless self.role.present?
      self.role = 1
    end
  end

  class << self
    def select_options
      User.active.map{ |user|
        name = user.name.blank? ? user.email : user.name
        [name, user.id]
      }
    end
  end
  def decrypted_password
    Devise::Encryptable::Encryptors::Aes256.decrypt(encrypted_password, Devise.pepper)
  end
end
####################################  Schema Information ##############################

# create_table "users", force: :cascade do |t|
#   t.string   "email",                  limit: 255, default: "",   null: false
#   t.string   "encrypted_password",     limit: 255, default: "",   null: false
#   t.string   "reset_password_token",   limit: 255
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.integer  "sign_in_count",          limit: 4,   default: 0,    null: false
#   t.datetime "current_sign_in_at"
#   t.datetime "last_sign_in_at"
#   t.string   "current_sign_in_ip",     limit: 255
#   t.string   "last_sign_in_ip",        limit: 255
#   t.string   "confirmation_token",     limit: 255
#   t.datetime "confirmed_at"
#   t.datetime "confirmation_sent_at"
#   t.string   "unconfirmed_email",      limit: 255
#   t.integer  "role",                   limit: 4
#   t.boolean  "active",                             default: true, null: false
#   t.datetime "created_at",                                        null: false
#   t.datetime "updated_at",                                        null: false
# end

# add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
# add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

# add_foreign_key "categories", "categories", column: "parent_id"