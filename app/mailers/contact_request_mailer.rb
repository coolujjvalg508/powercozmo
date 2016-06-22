class ContactRequestMailer < ApplicationMailer
	def reply(cr, message)
		@contact_request = cr
		@body = message
		mail(to: @contact_request.email, subject: "Re: #{@contact_request.subject}")
	end
end