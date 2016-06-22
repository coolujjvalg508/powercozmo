class ChangeProposalDeliveryTimeType < ActiveRecord::Migration
  def change
  	change_column :buying_proposals, :delivery_time, :string
  end
end
