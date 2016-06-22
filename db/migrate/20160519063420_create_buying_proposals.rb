class CreateBuyingProposals < ActiveRecord::Migration
  def change
    create_table :buying_proposals do |t|
    	t.text :proposal
 		 	t.float :price
 		 	t.string :delivery_time
 		 	t.integer :currency_id
 		 	t.integer :buying_request_id
 		 	t.integer :user_id
 		 	t.string :status
      t.timestamps null: false
    end
  end
end
