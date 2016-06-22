class Currency < ActiveRecord::Base
	enum status: { inactive: 0, active: 1}
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
	has_many :buying_proposals
end
