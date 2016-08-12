class CreateShippingPackages < ActiveRecord::Migration
  def change
    create_table :shipping_packages do |t|
      t.integer :order_id
      t.string :length
      t.string :width
      t.string :height
      t.string :weight

      t.timestamps null: false
    end
  end
end
