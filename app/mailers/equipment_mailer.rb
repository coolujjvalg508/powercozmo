class EquipmentMailer < ApplicationMailer

	def new_category_notification(type,value)
		@type = type
		@value = value
		mail(to: 'sk@mailinator.com', subject: 'New equipment posted with custom category')
	end

	def custom_category_equipment_activated(to, eq_name)
		@equipment_name = eq_name
		mail(to: to, subject: "Your equipment post has been activated")
	end

	def send_equipment_creation_notification(equipment)
		@system_email = SystemEmail.find_by(title: 'Email to seller after successful of Listing new equipment.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "Congratulation! Your advertising is live now." if @subject.blank?
    @equipment = equipment
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @user.is_a?(User)
	    @receiver = @user.email
	    mail(to: @receiver, subject: @subject)
    end
	end

  def send_post_expired_email_to_seller(equipment)
    @system_email = SystemEmail.find_by(title: 'Email to seller when post expired.')
    @subject =  @system_email.try(:subject).to_s
    @subject = "Warning! Your advertising is expired now." if @subject.blank?
    @equipment = equipment
    @user = @equipment.try(:user)
    if @equipment.is_a?(Equipment) && @user.is_a?(User)
      @receiver = @user.email
      mail(to: @receiver, subject: @subject)
    end
  end
end
