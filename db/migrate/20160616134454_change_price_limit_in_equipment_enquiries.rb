class ChangePriceLimitInEquipmentEnquiries < ActiveRecord::Migration
  def change
  	change_column :equipment_enquiries, :bidding_price, :decimal, precision: 14, scale: 2
  end
end
