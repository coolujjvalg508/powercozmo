class SiteSetting < ActiveRecord::Base
	validates :copy_right_text, :header_phone, :header_email, presence: true
end
