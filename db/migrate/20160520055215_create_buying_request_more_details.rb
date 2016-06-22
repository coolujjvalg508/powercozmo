class CreateBuyingRequestMoreDetails < ActiveRecord::Migration
  def change
    create_table :buying_request_more_details do |t|
    	t.string :receiver
    	t.string :subject
    	t.text :message
    	t.string :attachment
    	t.integer :user_id
      t.integer :buying_request_id
    	t.string :status
      t.timestamps null: false
    end
  end
end
