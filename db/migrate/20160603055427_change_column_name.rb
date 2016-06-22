class ChangeColumnName < ActiveRecord::Migration
  def change
	  rename_column :buying_requests, :origin_id, :origin
	  change_column :buying_requests, :origin, :string
	end
end
