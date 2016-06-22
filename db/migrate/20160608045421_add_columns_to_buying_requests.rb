class AddColumnsToBuyingRequests < ActiveRecord::Migration
  def change
  	add_column :buying_requests, :is_read, :boolean, default: false
  	add_column :buying_requests, :read_by_admin, :boolean, default: false
    add_column :buying_requests, :response_read_by_admin, :boolean, default: false
  end
end
