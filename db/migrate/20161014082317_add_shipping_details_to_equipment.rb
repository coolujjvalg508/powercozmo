class AddShippingDetailsToEquipment < ActiveRecord::Migration
  def change
	add_column :equipment, :pickup_port, :string
  end
end
