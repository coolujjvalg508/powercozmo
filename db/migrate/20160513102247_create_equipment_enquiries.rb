class CreateEquipmentEnquiries < ActiveRecord::Migration
  def change
    create_table :equipment_enquiries do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.references :country
      t.string :company_name
      t.string :company_website
      t.text :message
      t.decimal :bidding_price, precision: 10, scale: 2
      t.integer :enquiry_type
      t.references :equipment
      t.integer :replied_as, default: 1
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
