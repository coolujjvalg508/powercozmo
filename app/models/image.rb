class Image < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	attr_accessor :tmp_image

	############################ Associations #############################
	belongs_to :imageable, polymorphic: true 
end

####################################  Schema Information ##############################

# create_table "images", force: :cascade do |t|
#    t.string   "image",          limit: 255
#    t.integer  "imageable_id",   limit: 4,   null: false
#    t.string   "imageable_type", limit: 255, null: false
#    t.datetime "created_at",                 null: false
#    t.datetime "updated_at",                 null: false
#  end

#  add_index "images", ["imageable_id"], name: "index_images_on_imageable_id", using: :btree
#  add_index "images", ["imageable_type"], name: "index_images_on_imageable_type", using: :btree
