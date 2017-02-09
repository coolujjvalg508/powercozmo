ActiveAdmin.register BuyingRequest, :as => 'Buying Request Reports' do
	menu parent: "Reports", priority: 1, if: proc{ (current_admin_user.has_permission('buyingrequestreport_read'))}
	config.batch_actions = false
	actions :index

	index :download_links => ['csv'] do
    selectable_column
    column :title do |br|
      link_to br.title, admin_buying_request_path(br)
    end
    column "Serial Number", :identifier
    column "Buyer Name" do |br|
      br.name
    end
		column "No of Proposals" do |br|
      br.buying_proposals.count
    end
    column "No of Information Requests" do |br|
    	br.buying_request_more_details.count
    end
  end

  csv do
    column :title
    column "Buyer Name" do |br|
      br.name
    end
    column "No of Proposals" do |br|
      br.buying_proposals.count
    end
    column "No of Information requests" do |br|
      br.buying_request_more_details.count
    end
  end

  filter :title
  filter :identifier, label: "Serial Number"
  filter :name, label: "Buyer name"
end