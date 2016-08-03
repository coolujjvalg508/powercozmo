class SiteSetting < ActiveRecord::Base
	validates :copy_right_text, :header_phone, :header_email, :homepage_heading, :homepage_text, :homepage_search_text, presence: true
end
