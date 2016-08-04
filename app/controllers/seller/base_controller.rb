class Seller::BaseController < ApplicationController
	layout 'seller'
	before_filter :authenticate_user!
	before_filter :check_user
	
	def check_user
		if current_user.role == 2
			redirect_to root_path, notice: "You must be a seller to access this area !"
		end
	end
		
end
