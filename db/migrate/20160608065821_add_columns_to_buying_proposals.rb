class AddColumnsToBuyingProposals < ActiveRecord::Migration
  def change
  	add_column :buying_proposals, :is_read, :boolean, default: false
  	add_column :buying_proposals, :read_by_admin, :boolean, default: false
    add_column :buying_proposals, :response_read_by_admin, :boolean, default: false
  end
end
