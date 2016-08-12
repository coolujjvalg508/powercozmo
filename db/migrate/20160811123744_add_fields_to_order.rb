class AddFieldsToOrder < ActiveRecord::Migration
  def change
	add_column :orders, :user_id, :integer
	add_column :orders, :equipment_enquiry_id, :integer
	add_column :orders, :seller_remark, :text
	add_column :orders, :buyer_remark, :text
  end
end
