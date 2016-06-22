class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id, null: false, index: true
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :phone_number
      t.string :category
      t.string :website
      t.text :business_activity

      t.timestamps null: false
    end
  end
end
