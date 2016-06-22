class BuyingProposalMailer < ApplicationMailer
	def send_email_to_admin_proposal_submission_by_seller(buying_proposal)
		@buying_proposal = buying_proposal
    @buying_request = @buying_proposal.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'An Email to Admin after Proposal submission by seller on a buying request.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "New posted proposal." if @subject.blank?
    @admin_user = AdminUser.global_email_admin
    @user = @buying_proposal.try(:user)
    if @admin_user.is_a?(AdminUser) && @buying_proposal.is_a?(BuyingProposal) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @receiver = @admin_user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_email_to_seller_after_submission_of_proposal(buying_proposal)
		@buying_proposal = buying_proposal
    @buying_request = @buying_proposal.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'Email to seller after submission of proposal.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "We got Your proposal  for #{@buying_request.try(:title).to_s}." if @subject.blank?
    @user = @buying_proposal.try(:user)
    if @buying_proposal.is_a?(BuyingProposal) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_admin_approved_buying_proposal_email_to_seller(buying_proposal)
		@buying_proposal = buying_proposal
    @buying_request = @buying_proposal.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'An Email to Seller after proposal submission to buyer.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Your proposal for #{@buying_request.try(:title).to_s} has been forwarder to buyer." if @subject.blank?
    @user = @buying_proposal.try(:user)
    if @buying_proposal.is_a?(BuyingProposal) && @buying_request.is_a?(BuyingRequest) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject)
	  end
	end

	def send_admin_forwarded_buying_proposal_email_to_buyer(buying_proposal)
		@buying_proposal = buying_proposal
    @buying_request = @buying_proposal.try(:buying_request)
		@system_email = SystemEmail.find_by(title: 'Email to buyer: Admin forwarding the proposal of seller on a buying request of buyer.')
    @subject =  @system_email.try(:subject).to_s.gsub("::BUYING_REQUEST_NAME::",@buying_request.try(:title).to_s)
    @subject = "Proposal for Your buying request for #{@buying_request.try(:title).to_s}." if @subject.blank?
    if @buying_proposal.is_a?(BuyingProposal) && @buying_request.is_a?(BuyingRequest)
    	@attachment_name = @buying_request.try(:attachment).try(:url).to_s.split('/').last
    	attachments[@attachment_name] = @buying_request.try(:attachment).try(:url) if @attachment_name.present?
    	@attachment_name = "No attachment" unless @attachment_name.present?
	    @receiver = @buying_request.email
	    mail(to: @receiver, subject: @subject)
	  end
	end
end
