class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.string :page_reference
      t.boolean :active,        default: true,  null: false

      t.timestamps null: false
    end
  end
end
