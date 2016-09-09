namespace :newsletter do
  cur_time = Time.now.beginning_of_day
  namespace :equipment_suggestion do
    desc "Newsletter to user of newly added equipment according recent search in everyday at 09:00 AM"
    task to_user: :environment do
      
      search_history = SearchHistory.where('search_histories.search != ""')
		
		if search_history
		
			users = {}
	
			search_history.each do |v|		
				
				if !users[v.user_id]
					users[v.user_id] = Array.new
				end
				users[v.user_id].push(v.search.to_s)
			end
		
			last_sent_newsletters = SentNewsletter.order("id DESC").first
						
			users.each_with_index do |value, key|
		
				search_query = ''
				
				user_id = value.shift.to_s
				
				if last_sent_newsletters
				
					last_search_time = last_sent_newsletters.created_at.to_s
									
				else
				
					last_search = SearchHistory.where('search_histories.search != "" AND search_histories.user_id = ?', user_id).order("id DESC").first
					
					last_search_time = last_search.created_at.to_s
					
				end
				
				last_search_time = Date.parse(last_search_time).strftime('%Y-%m-%d %H:%M:%S')
								
				search_arr = value.slice(0)
				
				j = 0
				search_arr.each do |v|
				
					if j > 0
						search_query =	search_query + ' OR '
					end
					
					sub_search_query = ''
					final_arr = JSON.parse(v)
					
					i = 0
					final_arr.each_with_index do |v1, key1|
					
						if i > 0
							sub_search_query =	sub_search_query + ' AND '
						end
					
						if v1[0] == 'search'
						
							sub_search_query =	sub_search_query + ' (equipment.name LIKE "' + v1[1] + '" OR equipment.description LIKE "' + v1[1] + '" OR countries.name LIKE "' + v1[1] + '" OR categories.name LIKE "' + v1[1] + '" OR manufacturers.name = "' + v1[1] + '")'
						
						else
							sub_search_query =	sub_search_query + ' equipment.' + v1[0] + ' = ' + v1[1]
						end
						
						i = i + 1
					end
					search_query =	search_query + '(' + sub_search_query + ')'
				
					j = j + 1
				end
				
				equipment_result = Equipment.available_for_purchase.joins(:country, :manufacturer, :category, :user).where('equipment.user_id != ? AND equipment.created_at > ? AND (' + search_query + ')', user_id, last_search_time)
				
				if !equipment_result.empty?
				
					# Tell the NewsletterMailer to send a email
					user_data = User.find_by_id(user_id)
        
					NewsletterMailer.send_newsletter(user_data, equipment_result).deliver_now
					
					SentNewsletter.create(user_id: user_id)
										
				end
			
			end
			
			
		end
      
      
    end
  end

end
