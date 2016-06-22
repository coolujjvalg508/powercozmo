namespace :db do
  desc "This adds current settings to db"
  task add_site_settings: :environment do
  	SiteSetting.create(copy_right_text: "Copyright &copy; 2016 Power Cozmo, All rights reserved.", header_phone: "+91 9873550335", header_email: "info@powercozmo.com")
  end
end