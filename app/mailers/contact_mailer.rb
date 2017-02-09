class ContactMailer < ApplicationMailer

	def send_email_to_admin_new_contact_request(contact)
		@contact = contact    
		@system_email = SystemEmail.find_by(title: 'Email to admin if a new contact us request is received through contact us form.')
    @subject =  @system_email.try(:subject).to_s.gsub("::CONTACT_NAME::",@contact.try(:name).to_s)
    @subject = "A new contact request received from #{@contact.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin    
    if @admin_user.is_a?(AdminUser) && @contact.is_a?(Contact)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end
end
