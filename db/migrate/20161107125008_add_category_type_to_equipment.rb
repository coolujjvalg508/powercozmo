class AddCategoryTypeToEquipment < ActiveRecord::Migration
  def change
	add_column :equipment, :category_type, :string
  end
end
