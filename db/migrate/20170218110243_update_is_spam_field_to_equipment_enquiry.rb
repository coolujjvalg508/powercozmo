class UpdateIsSpamFieldToEquipmentEnquiry < ActiveRecord::Migration
  def change
  	remove_column :equipment_enquiries, :is_spam
  	add_column :equipment_enquiries, :is_spam, :boolean, default: false
  end
end
