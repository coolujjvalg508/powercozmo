class Country < ActiveRecord::Base
	########### Associations ############
	has_many :equipments
	#####################################
	enum status: { inactive: 0, active: 1}
	has_many :buying_requests, dependent: :destroy
	validates :name, presence: true
	validates :name, length: { maximum: 45 }
end
