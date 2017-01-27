class AddisSpamToequipmentEnquiries < ActiveRecord::Migration
  def change
  	add_column :equipment_enquiries, :is_spam, :integer, default: 0
  end
end