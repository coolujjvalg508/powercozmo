class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer :equipment_id, null: false, index: true
      t.float :price
			t.string :name
			t.string :email
			t.string :mobile
			t.integer :country_id
			t.string :company_name
			t.string :company_website
			t.float :commission
			t.string :status

      t.timestamps null: false
    end
  end
end
