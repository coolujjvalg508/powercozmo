class Seller::OrderController < Seller::BaseController

  def index  	
  	#@orders = current_user.orders.all.order('created_at desc').page(params[:page]).per(10)
  	@orders = Order.all.order('created_at desc').joins(:equipment).where('equipment.user_id = ? OR orders.email = ? ', current_user, current_user.email).page(params[:page]).per(10)
  	#abort(@orders.to_json)
  end

  def show
    
    @order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
    
    #@enquiry_data = EquipmentEnquiry.first.where('equipment_enquiries.user_id = ? AND equipment_enquiries.id = ?', @order.user_id, @order.equipment_enquiry_id)
    
    @enquiry = EquipmentEnquiry.find_by_id @order.equipment_enquiry_id
		
    #abort(@enquiry.responses.to_json)
    
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "power_cozmo_#{@order.equipment.name}",
        			 :layout => 'listing_detail_pdf.html.erb',
        			 :disposition => 'attachment'
      end
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

			@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
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
			flash[:notice] = "Invalid action !"
			redirect_to seller_order_path(params[:id])
	  end
	  
  end
  
  def update_shipping
    @order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
    @countries = Hash[Country.active.pluck(:id, :name)]
  end
  
  def save_shipping
  
	#abort(params.to_json)
	#abort(params[:order][:seller_remark].to_json)
	@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
	@countries = Hash[Country.active.pluck(:id, :name)]
  
	if params[:commit] == 'Update'
  
		@user = Order.find_by(id: params[:id])
		
		if params[:order][:update_type] == 'seller'
		
			if @user.update(no_of_packages: params[:order][:no_of_packages], pickup_country_id: params[:order][:pickup_country_id], pickup_city: params[:order][:pickup_city], pickup_port: params[:order][:pickup_port])
			
				flash[:notice] = "Successfully updated."
				redirect_to seller_order_path(params[:id])
			else
				@order = current_user.orders.all.order('created_at desc').find_by_id(params[:id])
				render 'update_shipping'
			end
			
		elsif params[:order][:update_type] == 'buyer'
		
			if @user.update(shipping_method: params[:order][:shipping_method], delivery_country_id: params[:order][:delivery_country_id], delivery_city: params[:order][:delivery_city], delivery_port: params[:order][:delivery_port])
			
				flash[:notice] = "Successfully updated."
				redirect_to seller_order_path(params[:id])
			else
				render 'update_shipping'
			end
			
		else
			flash[:notice] = "Invalid action !"
			redirect_to seller_order_path(params[:id])		
			
		end
			
	  else
			flash[:notice] = "Invalid action !"
			redirect_to seller_order_path(params[:id])
	  end
	  
  end
  

end
