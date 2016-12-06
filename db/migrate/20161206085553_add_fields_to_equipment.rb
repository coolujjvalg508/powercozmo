class AddFieldsToEquipment < ActiveRecord::Migration
  def change
  	add_column :equipment, :attachment, :string
  	add_column :equipment, :minimum_accepted_price, :float
  	add_column :equipment, :keywords, :string, :limit => 1000
  end
end
