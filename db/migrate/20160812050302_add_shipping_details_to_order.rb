class AddShippingDetailsToOrder < ActiveRecord::Migration
  def change
	add_column :orders, :no_of_packages, :integer
	add_column :orders, :shipping_method, :string
	add_column :orders, :pickup_country_id, :integer
	add_column :orders, :pickup_city, :string
	add_column :orders, :pickup_port, :string
	add_column :orders, :delivery_country_id, :integer
	add_column :orders, :delivery_city, :string
	add_column :orders, :delivery_port, :string
  end
end
