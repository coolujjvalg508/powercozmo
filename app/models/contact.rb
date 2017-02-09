class Contact < ActiveRecord::Base
	include Bootsy::Container

	enum status: {'New' => 0, 'Replied' => 1}

	validates :first_name,:last_name,:subject, :email, :message, presence: true
  validates :phone, format: {with: /\A[\+]*[0-9\-]*\z/, :message => "Please enter a valid phone number" }, :if => "phone.present?"
  validates_length_of :phone, :minimum => 10, :maximum => 18, too_short: "Must have at least %{count} digits", too_long: "Must have at most %{count} digits", :if => "phone.present?"
	validates :email, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i , :if => "email.present?"

	############## Call Backs ###########################
  after_create :send_email_to_admin_new_contact_request

  def name
  	first_name.to_s+' '+last_name.to_s
  end

  def send_email_to_admin_new_contact_request
  	ContactMailer.delay.send_email_to_admin_new_contact_request(self)
  end
end
