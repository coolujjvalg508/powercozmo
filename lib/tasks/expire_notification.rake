namespace :expire_notification do
  cur_time = Time.now
  namespace :buying_request do
    desc "Reminder to admin about buying requests expiring in next 24 hours."
    task to_admin: :environment do
    	@buying_requests = BuyingRequest.where(expiration_date: cur_time.to_date..(cur_time+24.hours).to_date)
    	@buying_requests.each do |buying_request|
  			BuyingRequestMailer.delay.send_email_to_admin_about_near_to_expire_buying_request(buying_request)
  		end
    end

    desc "Reminder to seller about buying requests expiring in next 24 hours."
    task to_seller: :environment do
    	@buying_requests = BuyingRequest.where(expiration_date: cur_time.to_date..(cur_time+24.hours).to_date).approved
      @buying_requests.each do |buying_request|
  			BuyingRequestMailer.delay.send_email_to_seller_about_near_to_expire_buying_request(buying_request)
  		end
    end

    desc "Notification to requester about expired buying request"
    task to_buyer: :environment do
      @buying_requests = BuyingRequest.where(expiration_date: Date.yesterday)
      @buying_requests.each do |buying_request|
        BuyingRequestMailer.delay.send_email_to_buyer_about_expiring_buying_request(buying_request)
      end
      @buying_requests.update_all(status: "Closed")
    end
  end

  namespace :equipment do
    desc "Notification about post expired in last 24 hours"
    task post_expired: :environment do
      # in future release 'available_for_purchase' scope can be replaced by 'active' scope
      @equipments = Equipment.where(availble_for: (cur_time - 24.hours)..cur_time).available_for_purchase
      @equipments.each do |equipment|
        EquipmentMailer.delay.send_post_expired_email_to_seller(equipment)
      end
      @equipments.update_all(status: 2)
    end
  end
end
