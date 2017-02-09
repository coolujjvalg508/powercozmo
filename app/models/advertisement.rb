class Advertisement < ActiveRecord::Base
	############################ Associations #############################

	has_one :image,as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :image, allow_destroy: true

  ########################### Validations ################################

	validates :title, presence: {message: "Title can't be blank"}
	validates :page_reference, presence: {message: "Page location can't be blank"}
end

##############################  Schema Information ##############################

# create_table "advertisements", force: :cascade do |t|
#   t.string   "title",          limit: 255
#   t.string   "page_reference", limit: 255
#   t.boolean  "active",                     default: true, null: false
#   t.datetime "created_at",                                null: false
#   t.datetime "updated_at",                                null: false
# end
