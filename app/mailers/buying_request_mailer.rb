class BuyingRequestMailer < ApplicationMailer

	def send_posted_buying_request_email_to_buyer(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'An Email to requester once post request (before admin approval)')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "We got Your buying request for #{@buying_request.try(:title).to_s}" if @subject.blank?
    if @buying_request.is_a?(BuyingRequest)
	    @receiver = @buying_request.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_posted_buying_request_email_to_admin(buying_request)
    @buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'Posted a buying request email sent to admin.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "New posted buying request." if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    if @admin_user.is_a?(AdminUser) && @buying_request.is_a?(BuyingRequest)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_admin_approved_buying_request_email_to_buyer(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'An Email to buying requester after approving request.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "We got Your buying request for #{@buying_request.try(:title).to_s}" if @subject.blank?
    if @buying_request.is_a?(BuyingRequest)
	    @receiver = @buying_request.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_admin_approved_buying_request_email_to_seller(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'An email after buying request approved by admin to all sellers.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "New buying request." if @subject.blank?
    @users = User.active.pluck(:email)
    if @buying_request.is_a?(BuyingRequest)
	    mail(bcc: @users, subject: @subject)
	  end
	end

	def send_email_to_seller_about_near_to_expire_buying_request(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'Email to sellers about near to expire buying request.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Expired Soon -Buying request #{@buying_request.try(:title).to_s}." if @subject.blank?
    @users = User.active.pluck(:email)
    if @buying_request.is_a?(BuyingRequest)
	    mail(bcc: @users, subject: @subject)
	  end
	end

	def send_email_to_admin_about_near_to_expire_buying_request(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'Email to Admin about near to expire buying request.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Expired Soon -Buying request #{@buying_request.try(:title).to_s}." if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    if @admin_user.is_a?(AdminUser) && @buying_request.is_a?(BuyingRequest)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_email_to_buyer_about_expiring_buying_request(buying_request)
		@buying_request = buying_request
		@system_email = SystemEmail.find_by(title: 'Email to requester about buying request expiring.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Your #{@buying_request.try(:title).to_s} is expired now." if @subject.blank?
    if @buying_request.is_a?(BuyingRequest)
	    @receiver = @buying_request.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

end
