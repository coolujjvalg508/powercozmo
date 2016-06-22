ActiveAdmin.register Category, :as => 'Category Reports' do
	menu parent: "Reports", priority: 1, if: proc{ (current_admin_user.has_permission('categoryreport_read'))}
	config.batch_actions = false
	actions :index

	controller do
    def scoped_collection
      Category.active.roots
    end
  end

	index :download_links => ['csv'] do
    selectable_column
    column :name
    column "No of Sub Category" do |cat|
      cat.children.count
    end
		column "No of Sub Sub Category" do |cat|
      cat.descendants.count - cat.children.count
    end
    column "No of Equipments" do |cat|
      cat.equipments.count
    end
    column "No of Buying Requests" do |cat|
    	cat.buying_requests.count
    end
  end

  csv do
    column :name
    column "No of Sub Category" do |cat|
      cat.children.count
    end
		column "No of Sub Sub Category" do |cat|
      cat.descendants.count - cat.children.count
    end
    column "No of Equipments" do |cat|
      cat.equipments.count
    end
    column "No of Buying Requests" do |cat|
    	cat.buying_requests.count
    end
  end

  filter :name
end