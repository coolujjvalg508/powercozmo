class AddIdentifierToBuyingRequests < ActiveRecord::Migration
  def change
  	add_column :buying_requests, :identifier, :string
  end
end
