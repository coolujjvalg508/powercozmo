class AddIsReadByBuyerFieldToEquipmentEnquiry < ActiveRecord::Migration
  def change
  	add_column :equipment_enquiries, :is_read_by_buyer, :boolean, default: false
  end
end
