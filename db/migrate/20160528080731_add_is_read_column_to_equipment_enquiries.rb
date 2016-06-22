class AddIsReadColumnToEquipmentEnquiries < ActiveRecord::Migration
  def change
    add_column :equipment_enquiries, :is_read, :boolean, default: false
  end
end
