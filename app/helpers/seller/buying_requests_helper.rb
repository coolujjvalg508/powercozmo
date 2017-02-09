module Seller::BuyingRequestsHelper
	def sent_info_request?(br)
		return BuyingRequestMoreDetail.where(buying_request_id: br.id, user_id: current_user.id).present?
	end

	def sent_proposal?(br)
		return current_user.buying_proposals.pluck(:buying_request_id).include?(br.id)
	end
end
