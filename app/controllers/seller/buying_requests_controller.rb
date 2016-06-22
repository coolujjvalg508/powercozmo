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

	private
	def buying_request_more_detail_params
		params.require(:buying_request_more_detail).permit(:receiver, :subject, :message, :attachment, :user_id, :buying_request_id, :status, :bootsy_image_gallery_id)
	end
end
