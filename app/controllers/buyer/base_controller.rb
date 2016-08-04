class Buyer::BaseController < ApplicationController
	layout 'buyer'
	before_filter :authenticate_user!
end
