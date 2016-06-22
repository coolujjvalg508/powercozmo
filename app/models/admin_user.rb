class AdminUser < ActiveRecord::Base
  acts_as_messageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable


  has_one :access_control, dependent: :destroy
  accepts_nested_attributes_for :access_control
  has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image

  validates :name, presence: {message: "Name can't be blank"}
  validates :email, presence: {message: "Email can't be blank"}
  validates :email, uniqueness: {message: 'This email is already registered with us.'}
  validates_format_of :email, :with  => Devise.email_regexp, :message => 'Please enter a valid email'
  validates :password, presence: {message: "Password can't be blank"}, on: :create
  validates :password_confirmation, presence: {message: "Password confirmation can't be blank"}, on: :create
  validates_confirmation_of :password


  def has_permission(action)
    if self.role == 'super_admin'
      return true
    else
      return false unless access_control.present?
      access_control.permissions_hash.include?(action)
    end
  end

 	##### MODULE ACCESS FOR ADMIN TYPE USERS #############
  MODULESTOPERMIT = ['admin', 'seller', 'country', 'currency', 'category', 'manufacturer', 'systememail', 'buyingrequest', 'banner', 'cms', 'advertisement', 'order', 'equipment', 'equipmentenquiry', 'commission','sellerreport','categoryreport','equipmentreport', 'buyingrequestreport', 'orderreport','message', 'sitesetting']

  def mailboxer_email(object)
    email
  end


  def unread_notifications_count
    EquipmentEnquiry.unread_by_admin.count.to_i + BuyingRequest.unread_by_admin.count.to_i + BuyingProposal.unread_by_admin.count.to_i + BuyingRequestMoreDetail.unread_by_admin.count.to_i
  end

  class << self
    def global_email_admin
      unless @_message_email_user.present?
        admin_email =  ENV["SUPER_ADMIN_EMAIL"]
        @_message_email_user = AdminUser.where(email: admin_email).first if admin_email.present?
        unless @_message_email_user.present?
          generated_password = Devise.friendly_token.first(8)
          @_message_email_user = AdminUser.create!(email: admin_email, name: 'Super Admin', password: generated_password, password_confirmation: generated_password, role: 'super_admin', active: true)
        end
      end
      @_message_email_user
    end
  end
end
