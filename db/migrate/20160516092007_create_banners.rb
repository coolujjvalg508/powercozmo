class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
