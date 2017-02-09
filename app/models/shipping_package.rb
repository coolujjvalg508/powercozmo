class ShippingPackage < ActiveRecord::Base
	
	######################### Associations ########################
	belongs_to :order
	belongs_to :equipment
	
end
