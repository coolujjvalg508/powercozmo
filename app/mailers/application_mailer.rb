class ApplicationMailer < ActionMailer::Base
	helper ApplicationHelper
  default from: "mailer@mailtester.tk"
  layout 'mailer'
  before_filter :add_inline_attachment!

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
