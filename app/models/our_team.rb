class OurTeam < ActiveRecord::Base

	########### Associations ############
	has_one :image, as: :imageable, dependent: :destroy
	#####################################
	
	accepts_nested_attributes_for :image
	validates_presence_of :image
	validates_associated :image
	
	#enum active: { inactive: 0, active: 1}
	
	validates :name, presence: true
	validates :name, length: { maximum: 200 }, if: "name.present?"
	validates :description, presence: true
	validates :description, length: { maximum: 200 }, if: "description.present?"

end
