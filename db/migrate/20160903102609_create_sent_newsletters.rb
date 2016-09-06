class CreateSentNewsletters < ActiveRecord::Migration
  def change
    create_table :sent_newsletters do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
