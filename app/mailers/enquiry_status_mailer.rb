class EnquiryStatusMailer < ApplicationMailer

	def send_posted_question_to_buyer(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after posted a question on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "We got Your Question for #{@equipment.try(:name).to_s}" if @subject.blank?
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.question?
	  end
	end

	def send_posted_offer_to_buyer(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to Buyer after posted offer on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "We got Your offer for #{@equipment.try(:name).to_s}" if @subject.blank?
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.bid?
	  end
	end

	def send_posted_buying_order_to_buyer(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after posted buying order on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "We got Your Purchase request for #{@equipment.try(:name).to_s}" if @subject.blank?
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.buy?
	  end
	end

	def send_posted_question_to_admin(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'An email to admin after posted a question on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New question for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @admin_user.is_a?(AdminUser)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.question?
	  end
	end

	def send_posted_offer_to_admin(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'An email to admin after posted an offer on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New offer for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @admin_user.is_a?(AdminUser)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.bid?
	  end
	end

	def send_posted_buying_order_to_admin(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'An Email to admin after posted buying order on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New buying request for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @admin_user.is_a?(AdminUser)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.buy?
	  end
	end

	def send_admin_approved_question_to_seller(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to seller after admin approved a question on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New Question for your listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.question? && @enquiry.try(:Approved?)
	  end
	end

	def send_admin_approved_offer_to_seller(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to seller after admin approved an offer on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New offer for your listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.bid? && @enquiry.try(:Approved?)
	  end
	end

	def send_admin_approved_buying_order_to_seller(enquiry)
    @enquiry = enquiry
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to seller after admin approved buying order on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "New buying request for your listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.buy? && @enquiry.try(:Approved?)
	  end
	end

	def send_seller_answered_a_question_to_admin(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to admin after seller answered a question on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller question answer for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @admin_user.is_a?(AdminUser) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if @enquiry.question? && @enquiry_response.status=="responded" && @enquiry.replied_as=='Accepted'
	  end
	end

	def send_seller_accepted_an_offer_to_admin(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to admin after seller accepted an offer on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller accepted buyer offer for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @admin_user.is_a?(AdminUser) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if (@enquiry.buy? || @enquiry.bid?) && @enquiry.replied_as=='Accepted' && @enquiry_response.status=="responded"
	  end
	end

	def send_seller_rejected_an_offer_to_admin(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to admin after seller rejected an offer on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller rejected buyer offer for #{@equipment.try(:name).to_s}" if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @admin_user.is_a?(AdminUser) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject) if (@enquiry.buy? || @enquiry.bid?) && @enquiry.replied_as=='Rejected' && @enquiry_response.status=="responded"
	  end
	end

	def forward_seller_answered_a_question_to_buyer(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after admin approved seller response on question on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller response to your question on listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.question? && @enquiry_response.status=="forwarded" && @enquiry.replied_as=='Accepted'
	  end
	end

	def forward_seller_accepted_an_offer_to_buyer(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after admin approved “seller acceptance offer” on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller accepted your offer for listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.bid? && @enquiry.replied_as=='Accepted' && @enquiry_response.status=="forwarded"
	  end
	end

	def forward_seller_rejected_an_offer_to_buyer(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after admin approved “seller rejected an offer” on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller rejected your offer for listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.bid? && @enquiry.replied_as=='Rejected' && @enquiry_response.status=="forwarded"
	  end
	end

	def forward_seller_accepted_buying_order_to_buyer(enquiry, enquiry_response)
    @enquiry = enquiry
    @enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after admin approved “seller approved buying request” on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller approved your buying request for listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.buy? && @enquiry.replied_as=='Accepted' && @enquiry_response.status=="forwarded"
	  end
	end

	def forward_seller_rejected_buying_order_to_buyer(enquiry, enquiry_response)
		@enquiry = enquiry
		@enquiry_response = enquiry_response
	  @equipment = @enquiry.try(:equipment)
		@system_email = SystemEmail.find_by(title: 'Email to buyer after admin approved “seller rejected buying request” on an equipment.')
    @subject =  @system_email.try(:subject).to_s.gsub("::ITEM_NAME::",@equipment.try(:name).to_s)
    @subject = "Seller rejected your buying request for listed #{@equipment.try(:name).to_s}" if @subject.blank?
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @enquiry.is_a?(EquipmentEnquiry) && @user.is_a?(User) && @enquiry_response.is_a?(EnquiryResponse)
	    @receiver = @enquiry.email
	    mail(to: @receiver, subject: @subject) if @enquiry.buy? && @enquiry.replied_as=='Rejected' && @enquiry_response.status=="forwarded"
	  end
	end

end
