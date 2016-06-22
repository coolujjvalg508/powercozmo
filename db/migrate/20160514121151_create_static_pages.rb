class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title, null: false
			t.string :url, null: false
			t.text :content
			t.boolean :active, null: false, default: true

      t.timestamps null: false
    end
  end
end
