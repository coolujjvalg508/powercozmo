class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
    	t.string :name, default: "", null: false
    	t.string :identifier, index: true
    	t.string :condition
    	t.string :owner_name, limit: 35
    	t.integer :manufacturer_id, index: true
    	t.integer :category_id, index: true
    	t.integer :sub_category_id, index: true
    	t.integer :sub_sub_category_id, index: true
    	t.string :city
    	t.integer :country_id, index: true
    	t.float :price
    	t.string :currency
    	t.integer :rating, limit: 2
    	t.text :description
    	t.integer :status, default: 1
    	t.datetime :availble_for
    	t.integer :manufacture_year, limit: 4
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
