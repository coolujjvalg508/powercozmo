class PageContentManagement < ActiveRecord::Base
	include Bootsy::Container
	validates :page_url, :page_section, :content, presence: true
end
