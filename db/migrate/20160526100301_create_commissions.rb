class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
    	t.string :name
      t.decimal :min_price, precision: 10, scale: 2
      t.decimal :max_price, precision: 10, scale: 2
      t.decimal :percent, precision: 5, scale: 2
      t.integer :status, deafult: 1

      t.timestamps null: false
    end
  end
end
