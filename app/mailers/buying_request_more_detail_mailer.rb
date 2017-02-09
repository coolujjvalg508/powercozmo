class BuyingRequestMoreDetailMailer < ApplicationMailer
	def send_email_to_admin_rfi_submission_by_seller(buying_request_more_detail)
		@buying_request_more_detail = buying_request_more_detail
    @buying_request = @buying_request_more_detail.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'Email to admin about request more information on a buying request of buyer.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "New RFI proposal." if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    @user = @buying_request_more_detail.try(:user)
    if @admin_user.is_a?(AdminUser) && @buying_request_more_detail.is_a?(BuyingRequestMoreDetail) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_email_to_seller_after_submission_of_rfi(buying_request_more_detail)
		@buying_request_more_detail = buying_request_more_detail
    @buying_request = @buying_request_more_detail.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'Email to seller after send RFI.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "We got Your RFI about #{@buying_request.try(:title).to_s}." if @subject.blank?
    @user = @buying_request_more_detail.try(:user)
    if @buying_request_more_detail.is_a?(BuyingRequestMoreDetail) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_admin_forwarded_rfi_email_to_buyer(buying_request_more_detail)
		@buying_request_more_detail = buying_request_more_detail
    @buying_request = @buying_request_more_detail.try(:buying_request)
		@system_email = SystemEmail.find_by(title: "Admin forwarding the seller's request more information on a buying request of buyer.")
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Request for more information for #{@buying_request.try(:title).to_s}." if @subject.blank?
    @user = @buying_request_more_detail.try(:user)
    if @buying_request_more_detail.is_a?(BuyingRequestMoreDetail) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @attachment_name = @buying_request_more_detail.try(:attachment).try(:url).to_s.split('/').last
    	attachments[@attachment_name] = @buying_request_more_detail.try(:attachment).read if @attachment_name.present?
    	@attachment_name = "No attachment" unless @attachment_name.present?
	    @receiver = @buying_request.email
	    mail(to: @receiver, subject: @subject)
	  end
	end
end
