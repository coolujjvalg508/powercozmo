ActiveAdmin.register Equipment, :as => 'Equipment Reports' do
	menu parent: "Reports", priority: 1, if: proc{ (current_admin_user.has_permission('equipmentreport_read'))}
	config.batch_actions = false
	actions :index

	index :download_links => ['csv'] do
    selectable_column
    column :name do |equipment|
    	link_to equipment.name, admin_equipment_path(equipment)
    end
    column :identifier
    column :owner_name
		column "No of Orders" do |equipment|
      equipment.orders.count
    end
    column "No of Biddings" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 2).count
    end
    column "No of Buying Enquiry" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 3).count
    end
    column "No of Questions" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 1).count
    end
  end

  csv do
    column :name
    column :owner_name
		column "No of Biddings" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 2).count
    end
    column "No of Buying Enquiry" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 3).count
    end
    column "No of Questions" do |equipment|
      equipment.equipment_enquiries.where(:enquiry_type => 1).count
    end
  end

  filter :name
  filter :identifier
  filter :owner_name
end