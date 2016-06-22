class AddModelToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :equipment_model, :string
  end
end
