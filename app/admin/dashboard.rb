ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        if current_admin_user.has_permission('seller_read')
          panel "Total Users" do
            ul do
            	li do
            		span class: 'dash_left' do
            			'Active Users'
            		end
            		span class: 'dash_right' do
            			link_to(User.active.count, admin_sellers_path(scope: 'active'))
            		end
            	end
            	li do
            	 	span class: 'dash_left' do
            			'InActive Users'
            		end
            	 	span class: 'dash_right' do
            	 	 link_to(User.inactive.count, admin_sellers_path(scope: 'inactive'))
            	 	end
            	end
            end
          end
        end
      end
      column do
        if current_admin_user.has_permission('category_read')
          panel "Total Categories" do
            ul do
            	li do
            		span class: 'dash_left' do
            			'Active Categories'
            		end
            		span class: 'dash_right' do
          			 	link_to(Category.active.count, admin_categories_path(scope: 'active'))
          			end
            	end
            	li do
            		span class: 'dash_left' do
            	 		'InActive Categories'
            		end
            	 	span class: 'dash_right' do
            	 	  link_to(Category.inactive.count, admin_categories_path(scope: 'inactive'))
            	 	end
            	end
            end
          end
        end
      end
      column do
        if current_admin_user.has_permission('equipment_read')
          panel "Total Equipments" do
            ul do
            	Equipment.statuses.keys.sort.each do |scope_name|
  	          	li do
  	          		span class: 'dash_left' do
  	          			"#{scope_name.to_s.humanize} Equipments"
  	          		end
  	          		span class: 'dash_right' do
  	          		  link_to(Equipment.send(scope_name.to_sym).count, admin_equipment_index_path(scope: scope_name))
  	          		end
  	          	end
            	end
            end
          end
        end
      end
      column do
        if current_admin_user.has_permission('order_read')
          panel "Total Orders" do
            ul do
            	order_status = Order::STATUS
            	order_status.each do |os|
  	          	li do
  	          		span class: 'dash_left' do
  	          			os
  	          		end
  	          		span class: 'dash_right' do
  	          		 	link_to(Order.select(:status).where(status: os).count, admin_orders_path("q[status_eq]" => os))
  	          		end
  	          	end
            	end
            end
          end
        end
      end
    end

    columns do
      column do
        if current_admin_user.has_permission('equipment_read')
          panel "Recently Posted Equipments" do
            ul do
            	@equipments = Equipment.select([:id, :name]).last(10)
            	@equipments.each do |eq|
  	          	li do	          
  	          		span link_to(eq.name, admin_equipment_path(eq))
  	          	end
            	end
            end
            span link_to("View All", admin_equipment_index_path)
          end
        end
      end
      column do
        if current_admin_user.has_permission('equipmentenquiry_read')
          panel "Recent Posted Enquiries" do
            ul do
            	@enquiries = EquipmentEnquiry.select([:id, :name]).last(10)
            	@enquiries.each do |eq|
  	          	li do	          
  	          		span link_to(eq.name, admin_equipment_enquiry_path(eq))
  	          	end
            	end
            end
            span link_to("View All", admin_equipment_enquiries_path)
          end
        end
      end
    end

    columns do
    	# column "Equipment Enquiries Overview" do
    		equipment_enquiries = {"Questions" => 1, "Bidding Request" => 2, "Buying Request" => 3}
        if current_admin_user.has_permission('equipmentenquiry_read')
  	      table class: 'category_table_dashboard' do
  	      	thead do 
  		      	tr do 
  		      		th ""
  			        th "Last 7 days"
  			        th "Last 30 days"
  			        th "Last 90 days"
  			        th "Last 365 days"
  		        end
  	      	end

  	        equipment_enquiries.each do |k,v|
          		tr do
  		        	td do
  		        		b k
  		        	end 
  		        	td link_to EquipmentEnquiry.get_enquiry_count_by_type(v, 7), admin_equipment_enquiries_path("q[enquiry_type_eq]"=> v, "q[created_at_gteq]" => EquipmentEnquiry.get_date_range(7)[:days_from], "q[created_at_lteq]" => EquipmentEnquiry.get_date_range(7)[:today])			        
  			        td link_to EquipmentEnquiry.get_enquiry_count_by_type(v, 30), admin_equipment_enquiries_path("q[enquiry_type_eq]"=> v, "q[created_at_gteq]" => EquipmentEnquiry.get_date_range(30)[:days_from], "q[created_at_lteq]" => EquipmentEnquiry.get_date_range(30)[:today])
  			        td link_to EquipmentEnquiry.get_enquiry_count_by_type(v, 90), admin_equipment_enquiries_path("q[enquiry_type_eq]"=> v, "q[created_at_gteq]" => EquipmentEnquiry.get_date_range(90)[:days_from], "q[created_at_lteq]" => EquipmentEnquiry.get_date_range(90)[:today])
  			        td link_to EquipmentEnquiry.get_enquiry_count_by_type(v, 365), admin_equipment_enquiries_path("q[enquiry_type_eq]"=> v, "q[created_at_gteq]" => EquipmentEnquiry.get_date_range(365)[:days_from], "q[created_at_lteq]" => EquipmentEnquiry.get_date_range(365)[:today])
  		        end
  	        end
  	      end
        end
    	# end
    end
  end
end
