class AddOfferedByUserIdToEquipmentEnquiry < ActiveRecord::Migration
  def change
  	add_column :equipment_enquiries, :offered_by_user_id, :integer
  end
end
