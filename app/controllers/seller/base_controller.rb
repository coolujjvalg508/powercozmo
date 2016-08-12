class Seller::BaseController < ApplicationController
	layout 'seller'
	before_filter :authenticate_user!
end
