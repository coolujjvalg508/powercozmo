class Commission < ActiveRecord::Base
	############### Enums #############
	enum status: [:inactive, :active]
	################ Scope #############
	scope :active, -> { where(:status => 1) }
	scope :for_price, -> (price) {Commission.ransack(min_price_lteq: price, max_price_gteq: price, status_eq: 1).result.pluck(:percent)}
	############### validations ########
	validates :min_price, :max_price, :percent, :status, presence: true
	validate :range_overlapping?
	validates_format_of :min_price, :max_price, :with  => /\A[0-9]{0,10}[\.]*[0-9]{0,2}\z/, :message => 'Max value for price is 9999999999.99'

	def range_overlapping?
		Commission.where.not(id: id).pluck(:min_price, :max_price).each do |range|
			#Below condition satisfies when there is a overlap
			if range[0] <= max_price && min_price <= range[1]
				errors.add(:base, "This range overlap with another existing commission range")
				return false
			end
		end
	end
end
