class ShippingPackage < ActiveRecord::Base
	
	######################### Associations ########################
	belongs_to :order
	
end
