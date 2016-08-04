class Buyer::BaseController < ApplicationController
	layout 'buyer'
	before_filter :authenticate_user!
	before_filter :check_user
	
	def check_user
		if current_user.role == 1
			redirect_to root_path, notice: "You must be a buyer to access this area !"
		end
	end
	
end
