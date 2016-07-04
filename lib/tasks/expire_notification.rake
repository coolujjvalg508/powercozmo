namespace :expire_notification do
  cur_time = Time.now
  namespace :buying_request do
    desc "Reminder to admin about buying requests expiring in next 24 hours."
    task to_admin: :environment do
    	@buying_requests = BuyingRequest.where(expiration_date: cur_time.to_date..(cur_time+24.hours).to_date).approved
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
      @buying_requests = BuyingRequest.where(expiration_date: Date.yesterday).approved
      @buying_requests.each do |buying_request|
        BuyingRequestMailer.delay.send_email_to_buyer_about_expiring_buying_request(buying_request)
      end
    end
  end

  namespace :equipment do
    desc "Notification about post expired in last 24 hours"
    task post_expired: :environment do
      @equipments = Equipment.where(availble_for: (cur_time - 24.hours)..cur_time).active
      @equipments.each do |equipment|
        EquipmentMailer.delay.send_post_expired_email_to_seller(equipment)
      end
    end
  end
  namespace :post do
    desc "Make the equipment listing and buying request status closed if post expired"
    task change_status: :environment do
      @exp_equipments = Equipment.where(availble_for: (cur_time - 24.hours)..cur_time).available_for_purchase
      @exp_equipments.update_all(status: 2)

      @exp_buying_requests = BuyingRequest.where(expiration_date: Date.yesterday)
      @exp_buying_requests.update_all(status: "Closed")
    end
  end

end
