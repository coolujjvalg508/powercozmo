class Seller::BuyingProposalsController < Seller::BaseController
	def index
		@proposals = current_user.buying_proposals.includes(:buying_request).order('created_at desc').page(params[:page])
	end

	def new
		if current_user.present?
			@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(params[:buying_request_id])
			@buying_proposal = BuyingProposal.new
			@image = @buying_proposal.build_image
		else
			redirect_to root_url
		end
	end

	def create
		@buying_proposal = BuyingProposal.new(buying_proposal_params)
		if @buying_proposal.save
			flash[:notice] = "Proposal sent successfully."
			redirect_to seller_buying_requests_path
		else
			@buying_request  = BuyingRequest.approved.where("expiration_date >= ?", Date.today).find(buying_proposal_params[:buying_request_id])
			render :new
		end
	end

	def show
		@buying_proposal = current_user.buying_proposals.find(params[:id])
		rescue ActiveRecord::RecordNotFound
      flash[:error] = "Proposal not found."
      redirect_to seller_buying_proposals_path
	end

	private
	def buying_proposal_params
		params.require(:buying_proposal).permit(:user_id, :proposal, :price, :delivery_time, :currency_id, :buying_request_id, :status, :attachment,:attachment_cache, image_attributes: [:id, :image, :imageable_id, :imageable_type])
	end
end
