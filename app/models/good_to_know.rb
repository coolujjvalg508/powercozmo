class GoodToKnow < ActiveRecord::Base
	include Bootsy::Container
	validates :question, :answer, presence: true
	default_scope { order('position ASC') }
end

############################ Schema Information ###############################
  # create_table "good_to_knows", force: :cascade do |t|
  #   t.text     "question",   limit: 65535
  #   t.text     "answer",     limit: 65535
  #   t.boolean  "active",                   default: true, null: false
  #   t.integer  "position",   limit: 4
  #   t.string   "name",       limit: 255
  #   t.datetime "created_at",                              null: false
  #   t.datetime "updated_at",                              null: false
  # end
