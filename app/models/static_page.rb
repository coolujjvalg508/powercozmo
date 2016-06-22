class StaticPage < ActiveRecord::Base
	include Bootsy::Container
	validates :title, :url, :content, presence: true
end
