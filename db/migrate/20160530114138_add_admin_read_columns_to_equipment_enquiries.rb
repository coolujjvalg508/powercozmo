class AddAdminReadColumnsToEquipmentEnquiries < ActiveRecord::Migration
  def change
    add_column :equipment_enquiries, :read_by_admin, :boolean, default: false
    add_column :equipment_enquiries, :response_read_by_admin, :boolean, default: false
  end
end
