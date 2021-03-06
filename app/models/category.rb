class Category < ActiveRecord::Base
	enum status: { inactive: 0, active: 1}
	acts_as_nested_set

	has_many :profiles
	has_many :buying_requests, dependent: :destroy
	has_one :image, as: :imageable, dependent: :destroy
	has_many :equipments
	accepts_nested_attributes_for :image

	validates :name, presence: true
	validate :category_level

	scope :active, -> { where(status: 1) }
	
	############################ Constants ################################
	
	CATEGORY_TYPE = {'Power Generator'=> 'P', 'Oil & Gas'=> 'O'}
	enum category_type: {'Power Generator'=> 'P', 'Oil & Gas'=> 'O'}

	########################### Validations ################################
	
	######## Solr search Start ########
  
	/searchable do
		text :name
		integer :id
		integer :status
	end/
  
    ######## Solr search End ##########

	def category_level
		parent = Category.find_by_id(parent_id)
		if parent && parent.level >= 2
			errors.add(:parent_id, "Parent can not be a sub sub category.")
		end
	end
end
