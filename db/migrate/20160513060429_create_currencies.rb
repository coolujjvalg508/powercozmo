class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, limit: 35
      t.string :symbol, limit: 35
      t.integer :status, default: 1
      t.timestamps null: false
    end
  end
end
