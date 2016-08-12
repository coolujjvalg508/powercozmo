class AddUserIdToEquipmentEnquiry < ActiveRecord::Migration
  def change
	add_column :equipment_enquiries, :user_id, :integer
  end
end
