ActiveAdmin.register User, :as => 'Seller Reports' do
	menu parent: "Reports", priority: 1, if: proc{ (current_admin_user.has_permission('sellerreport_read') || current_admin_user.has_permission('sellerreport_write') || current_admin_user.has_permission('sellerreport_delete'))}
	config.batch_actions = false
	actions :index

	index :download_links => ['csv'] do
    selectable_column
    column 'Name' do |user|
      link_to user.name, admin_seller_path(user)
    end
    column :email
    column "Registered Date" do |user|
    	user.created_at
    end
    column 'No of Equipments' do |user|
      user.equipment.count
    end
    column 'No of Orders' do |user|
      user.orders.count
    end
  end

  csv do
    column :name
    column :email
    column "Registered Date" do |user|
    	user.created_at
    end
    column 'No of Equipments' do |user|
      user.equipment.count
    end
    column 'No of Orders' do |user|
      user.orders.count
    end
  end

  filter :profile_first_name,:label => "First name", :as => :string
  filter :profile_last_name,:label => "Last name", :as => :string
  filter :email
  filter :created_at, label: "Registered"
end