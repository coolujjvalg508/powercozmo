class CreateSiteSettings < ActiveRecord::Migration
  def change
    create_table :site_settings do |t|
      t.string :copy_right_text
      t.string :header_phone
      t.string :header_email

      t.timestamps null: false
    end
  end
end
