class CreatePageContentManagements < ActiveRecord::Migration
  def change
    create_table :page_content_managements do |t|
      t.string :page_url
      t.string :page_section
      t.text :content
      t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
