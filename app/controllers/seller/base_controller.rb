class Seller::BaseController < ApplicationController
	layout 'seller'
	#layout 'user'
	before_filter :authenticate_user!
end
