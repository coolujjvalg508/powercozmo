class AddEquimentIdToShippingPackage < ActiveRecord::Migration
  def change
	add_column :shipping_packages, :equipment_id, :integer
  end
end
