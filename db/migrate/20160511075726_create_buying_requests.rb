class CreateBuyingRequests < ActiveRecord::Migration
  def change
    create_table :buying_requests do |t|
    	t.string :title
    	t.integer :origin_id
      t.integer :location_id
      t.integer :brand_id
      t.integer :category_id
      t.string :lead_type
      t.string :condition
      t.date :expiration_date
      t.string :attachment
      t.string :end_user
      t.string :city
      t.string :image
      t.text :description
      # User Information
      t.string :name
      t.string :email
      t.string :mobile
      t.integer :country_id
      t.string :company_name
      t.string :company_website
      t.string :address
      t.string :status
      t.timestamps null: false
    end
  end
end