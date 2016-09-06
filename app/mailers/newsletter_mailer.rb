class NewsletterMailer < ApplicationMailer

	default from: 'narendra.prajapat@brsoftech.org'

	def send_newsletter(user_data, equipment_result)
	
		
		@user_data = user_data
		@equipment_result = equipment_result
				
		mail(to: @user_data.email, subject: 'Powercozmo: Equipment you may interested')
	
	end
	

end
