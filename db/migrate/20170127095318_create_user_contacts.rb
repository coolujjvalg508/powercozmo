class CreateUserContacts < ActiveRecord::Migration
  def change
    create_table :user_contacts do |t|

      t.integer :user_id	
      t.integer :contact_user_id	
      
      t.timestamps null: false
    end
  end
end
