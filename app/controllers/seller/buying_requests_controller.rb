class Seller::BuyingRequestsController < Seller::BaseController

	def index
		if current_user.present?
			@buying_requests = BuyingRequest.approved.order("created_at DESC").search(params[:q]).page(params[:page])
		else
			redirect_to root_url
		end
	end

	def show
		if current_user.present?			
			@buying_request = BuyingRequest.approved.find(params[:id])
		else
			redirect_to root_url
		end
	end

	def request_for_more_info
		@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(params[:buying_request_id])
		@request_for_more_info = BuyingRequestMoreDetail.new
	end

	def send_request_for_more_info
		@request_for_more_info = BuyingRequestMoreDetail.new(buying_request_more_detail_params)
		if @request_for_more_info.save
			flash[:notice] = "Request sent successfully."
			redirect_to seller_buying_requests_path
		else
			@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(buying_request_more_detail_params[:buying_request_id])
			render :request_for_more_info
		end
	end
	
	def my_buying_request_list
		if current_user.present?
			@buying_requests = BuyingRequest.all.order("created_at DESC").where('(buying_requests.user_id = ? OR buying_requests.email = ?)', current_user, current_user.email).page(params[:page])
		
			render :index
						
		else
			redirect_to root_url
		end
	end	
	
	def my_buying_request_show
		if current_user.present?			
			@buying_request = BuyingRequest.where('buying_requests.id = ? AND (buying_requests.user_id = ? OR buying_requests.email = ?)', params[:id], current_user, current_user.email).first
						
			if !@buying_request 
				flash[:error] = "Invalid Access !"
				redirect_to seller_my_buying_request_list_path
			else
				render :show
			end	
		else
			redirect_to root_url
		end
	end
		
	def destroy
		if BuyingRequest.destroy(params[:id])
			flash[:notice] = "Buying request successfully removed."
		else
			flash[:notice] = "Failed to delete"
		end
		redirect_to seller_my_buying_request_list_path
	end
	
	private
	def buying_request_more_detail_params
		params.require(:buying_request_more_detail).permit(:receiver, :subject, :message, :attachment, :user_id, :buying_request_id, :status, :bootsy_image_gallery_id)
	end
		
end
