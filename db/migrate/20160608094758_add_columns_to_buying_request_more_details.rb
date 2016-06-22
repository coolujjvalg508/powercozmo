class AddColumnsToBuyingRequestMoreDetails < ActiveRecord::Migration
  def change
  	add_column :buying_request_more_details, :is_read, :boolean, default: false
  	add_column :buying_request_more_details, :read_by_admin, :boolean, default: false
    add_column :buying_request_more_details, :response_read_by_admin, :boolean, default: false
  end
end
