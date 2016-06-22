class AddPowerPlantFieldsToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :power_plant_type, :string
    add_column :equipment, :power_plant_age, :string
    add_column :equipment, :turbine_manufacturer_name, :string
    add_column :equipment, :turbine_model, :string
    add_column :equipment, :equipment_type, :string, default: "equipment"
  end
end
