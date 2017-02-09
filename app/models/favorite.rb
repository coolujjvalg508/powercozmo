class Favorite < ActiveRecord::Base

	############# Associations ########################
	belongs_to :equipment
	belongs_to :user

end
