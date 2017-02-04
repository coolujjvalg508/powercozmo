class AddAttachementToEnquiryResponse < ActiveRecord::Migration
  def change
  	add_column :enquiry_responses, :attachment, :string
  end
end
