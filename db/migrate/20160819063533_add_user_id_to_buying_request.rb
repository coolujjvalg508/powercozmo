class AddUserIdToBuyingRequest < ActiveRecord::Migration
  def change
	add_column :buying_requests, :user_id, :integer
  end
end
