class AddResponseToEquipmentEnquiries < ActiveRecord::Migration
  def change
    add_column :equipment_enquiries, :response, :text
    add_column :equipment_enquiries, :response_status, :integer
  end
end
