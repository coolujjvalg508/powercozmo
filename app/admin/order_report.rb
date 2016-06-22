ActiveAdmin.register Order, :as => 'Order Reports' do
	menu parent: "Reports", priority: 1, if: proc{ (current_admin_user.has_permission('orderreport_read'))}
	config.batch_actions = false
	actions :index

  controller do
    def scoped_collection
      super.select '*, price * commission/100 as commission_amount'
    end
  end

	index :download_links => ['csv'] do
    selectable_column
    column "Order id" do |order|
      link_to order.id, admin_orders_path(id)
    end
    column :seller_name do |order|
      link_to order.seller.name, admin_seller_path(order.seller)
    end
    column :seller_email do |order|
      order.seller.email
    end
    column :buyer_name do |order|
      order.name
    end
    column :buyer_email do |order|
      order.email
    end
    column :equipment do |order|
      link_to order.equipment.name, admin_equipment_path(order.equipment)
    end
    column :total_amount,sortable: "price" do |order|
      order.price
    end
    column :commission_amount, sortable: "commission_amount" do |order|
      order.price * order.commission/100
    end
    column :status
  end

  csv do
    column "Order id" do |order|
      order.id
    end
    column :seller_name do |order|
      link_to order.seller.name, admin_seller_path(order.seller)
    end
    column :seller_email do |order|
      order.seller.email
    end
    column :buyer_name do |order|
      order.name
    end
    column :buyer_email do |order|
      order.email
    end
    column :equipment do |order|
      order.equipment.name
    end
    column :total_amount do |order|
      order.price
    end
    column :commission_amount do |order|
      order.price * order.commission/100
    end
    column :status
  end
  filter :name, label: "Buyer Name"
  filter :equipment
  filter :price, label: "Total amount"
  filter :status,as: :select, collection: ["Seller Confirmed", "Request For Shipping", "Shipped To Buyer", "Buyer Confirmed", "Payment Done", "Completed", "Closed"]
end