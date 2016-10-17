class AddShippingDetailsToEquipmentEnquiry < ActiveRecord::Migration
  def change
	add_column :equipment_enquiries, :shipping_method, :string
	add_column :equipment_enquiries, :delivery_city, :string
	add_column :equipment_enquiries, :delivery_port, :string
  end
end
