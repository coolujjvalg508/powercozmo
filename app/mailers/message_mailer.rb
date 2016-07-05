class MessageMailer < Mailboxer::MessageMailer
  helper ApplicationHelper
  default from: "Power Cozmo <#{ ENV['DEFAULT_FROM_EMAIL'] }>"
  layout 'mailer'
  before_filter :add_inline_attachment!

  def send_email(message, receiver)
    if message.conversation.messages.size > 1
      reply_message_email(message,receiver)
    else
      new_message_email(message,receiver)
    end
  end

  #Sends an email for indicating a new message for the receiver
  def new_message_email(message,receiver)
    @message  = message
    @receiver = receiver
    set_subject(message)
    if message.attachment.try(:url).present?
	    attachment_name = message.attachment.try(:url).split('/').last
	    attachments[attachment_name] = message.try(:attachment).read if attachment_name.present?
    end
    mail :to => receiver.send(Mailboxer.email_method, message),
         :subject => t('mailboxer.message_mailer.subject_new', :subject => @subject),
         :template_name => 'new_message_email.html.erb'
  end

  #Sends and email for indicating a reply in an already created conversation
  def reply_message_email(message,receiver)
    @message  = message
    @receiver = receiver
    set_subject(message)
    if message.attachment.try(:url).present?
	    attachment_name = message.attachment.try(:url).split('/').last
	    attachments[attachment_name] = message.try(:attachment).read if attachment_name.present?
    end
    mail :to => receiver.send(Mailboxer.email_method, message),
         :subject => t('mailboxer.message_mailer.subject_reply', :subject => @subject),
         :template_name => 'reply_message_email'
  end

  private

  def add_inline_attachment!
    attachments.inline["logo.jpg"] = File.read(Rails.root.join('app/assets/images/logo.jpg'))
		attachments.inline["banner-bg.jpg"] = File.read(Rails.root.join('app/assets/images/banner-bg.jpg'))
		attachments.inline["fb.png"] = File.read(Rails.root.join('app/assets/images/fb.png'))
		attachments.inline["twt.png"] = File.read(Rails.root.join('app/assets/images/twt.png'))
		attachments.inline["in.png"] = File.read(Rails.root.join('app/assets/images/in.png'))
		attachments.inline["gl.png"] = File.read(Rails.root.join('app/assets/images/gl.png'))
		attachments.inline["yt.png"] = File.read(Rails.root.join('app/assets/images/yt.png'))
  end
end