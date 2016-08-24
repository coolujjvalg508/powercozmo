class AddFaultsToEquipment < ActiveRecord::Migration
  def change
	add_column :equipment, :faults, :text
  end
end
