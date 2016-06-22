class Manufacturer < ActiveRecord::Base
	########### Associations ############
	has_many :equipments
	#####################################
	enum status: { inactive: 0, active: 1}
	has_many :buying_requests
	validates :name, presence: true
	validates :name, length: { maximum: 100 }, if: "name.present?"
end
