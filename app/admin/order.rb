ActiveAdmin.register Order do
  menu label: 'Manage Orders', parent: 'Orders', if: proc{ (current_admin_user.has_permission('order_read') || current_admin_user.has_permission('order_write') || current_admin_user.has_permission('order_delete'))}

  actions :all, except: [:new, :destroy]

  permit_params :price, :name, :email, :mobile, :country_id, :company_name, :company_website, :commission, :status

  action_item :back, only: :show do
    link_to "Back", collection_path, method: :get
  end

  action_item :back, only: :show do
    link_to "Print", "#",id: "print-order", method: :get
  end

  batch_action "Update 'Status' for", form: { status: [['Seller Confirmed','Seller Confirmed'],['Request For Shipping','Request For Shipping'], ['Shipped To Buyer', 'Shipped To Buyer'], ['Buyer Confirmed', 'Buyer Confirmed'], ['Payment Done', 'Payment Done'], ['Completed', 'Completed'], ['Closed', 'Closed']] } do |ids, inputs|
    Order.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end

  controller do
    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('order_read') && !current_admin_user.has_permission('order_write') && !current_admin_user.has_permission('order_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('order_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('order_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('order_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('order_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('order_delete'))
        super - disallowed
      end
    end
  end

  # Index page
  index :download_links => ['csv'] do
    selectable_column
    column :equipment_id
    column 'Equipment Identifier' do |order|
      order.equipment.identifier
    end
    column 'Equipment Category' do |order|
      order.equipment.try(:category).try(:name)
    end
    column :price
    column 'Buyer Name' , :name
    column 'Buyer Email' , :email
    column 'Buyer Country' , :country_id
    column 'Commission' do |order|
      number_to_percentage(order.commission, precision: (order.commission.round == order.commission) ? 0 : 2)
    end
    column :status
    column :created_at
    actions
  end

   # Filters
  filter :equipment
  filter :price
  filter :name, label: 'Buyer Name'
  filter :email, label: 'Buyer Email'
  filter :country, label: 'Buyer Country'
  filter :commission
  filter :status, as: :select, collection: ["Seller Confirmed", "Request For Shipping", "Shipped To Buyer", "Buyer Confirmed", "Payment Done", "Completed", "Closed"]
  filter :created_at


  # New/Edit Form
  form multipart: true do |f|
    f.inputs "Order Details" do
      f.input :equipment_id, as: :string, :input_html => { :value => f.object.equipment.name, :disabled => true}
      f.input :price
      f.input :commission
      f.input :status, as: :select, collection: Order::STATUS, include_blank: 'Select Status'
    end
    f.inputs "Buyer Details" do
      f.input :name, label: 'Buyer Name'
      f.input :email, label: 'Buyer Email'
      f.input :mobile, label: 'Buyer Mobile Number'
      f.input :country_id, label: 'Buyer Country', as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country'
      f.input :company_name, label: 'Buyer Comapny Name'
      f.input :company_website, label: 'Buyer Company Website'
    end
    f.actions
  end

  # Show page
  show do
    attributes_table do
      row :equipment_id
      row :price
      row 'Commission' do |order|
        number_to_percentage(order.commission, precision: (order.commission.round == order.commission) ? 0 : 2)
      end
      row :status
      row :created_at
      row :updated_at
    end
    panel "Buyer Details" do
      attributes_table_for order do
        row('Buyer Name'){ |r| r.name }
        row('Buyer Email'){ |r| r.email }
        row('Buyer Mobile Number'){ |r| r.mobile }
        row('Buyer Country'){ |r| r.country.name }
        row('Buyer Comapny Name'){ |r| r.company_name }
        row('Buyer Company Website'){ |r| r.company_website }
      end
    end
    panel "Seller Details" do
      attributes_table_for order do
        row('Seller Name'){ |r| r.seller.profile.name }
        row('Seller Email'){ |r| r.seller.email }
        row('Seller Mobile Number'){ |r| r.seller.profile.phone_number }
        row('Seller Country'){ |r| r.seller.profile.country.name }
        row('Seller Comapny Name'){ |r| r.seller.profile.company_name }
        row('Seller Company Website'){ |r| r.seller.profile.website }
      end
    end
  end
end
