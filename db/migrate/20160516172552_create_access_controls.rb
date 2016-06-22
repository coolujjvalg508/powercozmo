class CreateAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls do |t|
    	t.integer  "admin_user_id"
    	t.text   "permissions"
      t.timestamps null: false
    end
  end
end
