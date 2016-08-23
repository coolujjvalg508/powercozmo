class Seller::OrderController < Seller::BaseController

  def index  	
  	#@orders = current_user.orders.all.order('created_at desc').page(params[:page]).per(10)
  	@orders = Order.all.order('created_at desc').joins(:equipment).where('equipment.user_id = ? OR orders.user_id = ? ', current_user, current_user).page(params[:page]).per(10)
  	#abort(@orders.to_json)
  end

  def show
    
    #@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
    #@order = Order.all.find_by_id(params[:id])
    
    @order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
    
    #abort(@order.to_json)
    
    if !@order
		flash[:error] = "Invalid Access !"
		redirect_to seller_orders_path
		
	else
	
		 #@enquiry_data = EquipmentEnquiry.first.where('equipment_enquiries.user_id = ? AND equipment_enquiries.id = ?', @order.user_id, @order.equipment_enquiry_id)
    
		@enquiry = EquipmentEnquiry.find_by_id @order.equipment_enquiry_id
		   
		#abort(@enquiry.responses.to_json)
		#abort(respond_to.to_json)
		
		respond_to do |format|
		  format.html
		  format.pdf do
			render :pdf => "power_cozmo_#{@order.equipment.name}",
						 :layout => 'listing_detail_pdf.html.erb',
						 :disposition => 'attachment'
		  end
		end  	
		
    end
    
  end
  
  
  def download_invoice
        
    @order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
        
    if !@order
		flash[:error] = "Invalid Access !"
		redirect_to seller_orders_path
		
	else
	      		
		render :pdf => "power_cozmo_#{@order.equipment.name}",
						 :layout => 'listing_detail_pdf.html.erb',
						 :disposition => 'attachment' 	
		
    end
    
     
  end
  
  def update
  
	#abort(params[:order][:seller_remark].to_json)
  
	if params[:commit] == 'Submit'
	
		if params[:order][:seller_remark]
		
			@user = Order.find_by(id: params[:id])
			@user.update(seller_remark: params[:order][:seller_remark])
		
		elsif params[:order][:buyer_remark]
		
			@user = Order.find_by(id: params[:id])
			@user.update(buyer_remark: params[:order][:buyer_remark])
		
		end
		
		flash[:notice] = "Successfully updated."
		redirect_to seller_order_path(params[:id])
  
	elsif params[:commit] == 'Update'
  
		@user = Profile.find_by(id: params[:user][:profile_attributes][:id])
		if @user.update(first_name: params[:user][:profile_attributes][:first_name], last_name: params[:user][:profile_attributes][:last_name], company_name: params[:user][:profile_attributes][:company_name])
		
			flash[:notice] = "Successfully updated."
			redirect_to seller_order_path(params[:id])
		else
		
			#abort(@user.errors[:first_name].to_json)
			#abort(@user.errors.to_json)

			#@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
			@order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
			@enquiry = EquipmentEnquiry.find_by_id @order.equipment_enquiry_id
			render 'show'
		end
		
	  elsif params[:commit] == 'Accept'
	  
			@user = Order.find_by(id: params[:id])
			@user.update(status: 'Buyer Confirmed')
	  
			flash[:notice] = "Order successfully accepted."
			redirect_to seller_order_path(params[:id])
	  	
	  elsif params[:commit] == 'Reject'	
	  
			@user = Order.find_by(id: params[:id])
			@user.update(status: 'Order Cancelled')
			
			flash[:notice] = "Order successfully rejected."
			redirect_to seller_order_path(params[:id])
			
	  else
			flash[:error] = "Invalid action !"
			redirect_to seller_order_path(params[:id])
	  end
	  
  end
  
  def update_shipping
  
    #@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
    @order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
    @countries = Hash[Country.active.pluck(:id, :name)]
  end
  
  def save_shipping
  
	
	#abort(params.to_json)
	
	#abort(params[:order][:seller_remark].to_json)
	#@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
	@order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
	@countries = Hash[Country.active.pluck(:id, :name)]
  
	if params[:commit] == 'Update'
  
		@user = Order.find_by(id: params[:id])
		
		if params[:order][:update_type] == 'seller'
		
			i = 0
			shipping_package = params[:order][:shipping_package]
    
			if shipping_package
				shipping_package.each_with_index do |s_package, index| 
					#abort(s_package[1][:width].to_json)
					
					length = s_package[1][:length]
					width = s_package[1][:width]
					height = s_package[1][:height]
					weight = s_package[1][:weight]
					
					if length != '' || width != '' || height != '' || weight != ''
						if i == 0
							ShippingPackage.where(order_id: params[:id]).delete_all
						end
						ShippingPackage.create(order_id: params[:id], length: length, width: width, height: height, weight: weight)
						i = i + 1
					end
				 end
			 end
		
		    if i > 0
				if @user.update(no_of_packages: i, pickup_country_id: params[:order][:pickup_country_id], pickup_city: params[:order][:pickup_city], pickup_port: params[:order][:pickup_port])
				
					flash[:notice] = "Successfully updated."
					redirect_to seller_order_path(params[:id])
				else
					#@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
					@order = Order.all.joins(:equipment).where('orders.id = ? AND (equipment.user_id = ? OR orders.user_id = ?) ', params[:id], current_user, current_user).first
					render 'update_shipping'
				end
			else
			
				flash[:error] = "Failed, Enter atlease one shipping detail !"
				redirect_to seller_update_shipping_path(params[:id])
			
			end
			
		elsif params[:order][:update_type] == 'buyer'
		
			if @user.update(shipping_method: params[:order][:shipping_method], delivery_country_id: params[:order][:delivery_country_id], delivery_city: params[:order][:delivery_city], delivery_port: params[:order][:delivery_port])
			
				flash[:notice] = "Successfully updated."
				redirect_to seller_order_path(params[:id])
			else
				render 'update_shipping'
			end
			
		else
			flash[:error] = "Invalid action !"
			redirect_to seller_order_path(params[:id])		
			
		end
			
	  else
			flash[:error] = "Invalid action !"
			redirect_to seller_order_path(params[:id])
	  end
	  
  end
  

end
