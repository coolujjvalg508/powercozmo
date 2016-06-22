class Banner < ActiveRecord::Base
	enum status: { inactive: 0, active: 1}
	has_one :image, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image
  validates_presence_of :image
  validates_associated :image
end
