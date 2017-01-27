class UserContact < ActiveRecord::Base

	belongs_to :user
	belongs_to :contact_user, :class_name => "User", :foreign_key => "contact_user_id"

end
