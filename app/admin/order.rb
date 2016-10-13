ActiveAdmin.register Order do
  menu label: 'Manage Orders', parent: 'Orders', if: proc{ (current_admin_user.has_permission('order_read') || current_admin_user.has_permission('order_write') || current_admin_user.has_permission('order_delete'))}

  actions :all, except: [:new, :destroy]

  permit_params :price, :name, :email, :mobile, :country_id, :company_name, :company_website, :commission, :status, :shipping_method, :pickup_country_id, :pickup_city, :pickup_port, :delivery_country_id, :delivery_city, :delivery_port, :seller_remark, :buyer_remark
    
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
    
    f.inputs "Shipping Details" do
	  f.input :shipping_method, label: 'Shipping Method', as: :select, collection: (Order::SHIPPING_METHOD), include_blank: 'Select Shipping Method'
	  f.input :pickup_country_id, label: 'Pickup Country', as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country'	
	  f.input :pickup_city, label: 'Pickup City'
	  f.input :pickup_port, label: 'Pickup Port'
	  f.input :delivery_country_id, label: 'Delivery Country', as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country'	
	  f.input :delivery_city, label: 'Delivery City'
	  f.input :delivery_port, label: 'Delivery Port'
    end
    
    f.inputs "Terms" do
	  f.input :seller_remark, label: 'Seller Terms'
	  f.input :buyer_remark, label: 'Buyer Terms'
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
    
    panel "Shipping Details" do
      attributes_table_for order do
        row('Number Of Packages'){ |r| (r.no_of_packages != 0) ? r.no_of_packages : '-' }
        row('Shipping Method'){ |r| r.shipping_method }
        row('Pickup Country'){ |r| r.pickup_country.name }
        row('Pickup City'){ |r| r.pickup_city }
        row('Pickup Port'){ |r| r.pickup_port }
        row('Delivery Country'){ |r| r.delivery_country.name }
        row('Delivery City'){ |r| r.delivery_city }
        row('Delivery Port'){ |r| r.delivery_port }
      end
    end
    
    
	panel "Packages Dimensions" do
		attributes_table_for order do
			columns do
				column do
					span "&nbsp;".html_safe
				end
				column do
					strong "Length"
				end
				column do
					strong "Width"
				end
				column do
					strong "Height"
				end
				column do
					strong "Weight"
				end
			end
		
		if order.shipping_package.present?
			i = 1;
			order.shipping_package.each do |p|
				columns do
					column do
						span "Package " + i.to_s
					end
					column do
						span p.length
					end
					column do
						span p.width
					end
					column do
						span p.height
					end
					column do
						span p.weight
					end
				end
				i = i + 1
			end
		else
			columns do
				column do
					span "Packages dimensions details not available" 
				end
			end
		end

      end
    end
    
    panel "Terms" do
      attributes_table_for order do
        row('Seller Terms'){ |r| r.seller_remark }
        row('Buyer Terms'){ |r| r.buyer_remark }
      end
    end
    
    enquiry = EquipmentEnquiry.find_by_id order.equipment_enquiry_id
    
    if enquiry.responses.present?
		panel "Enquiry Responses" do
			enquiry.responses.each do |res|
				attributes_table_for res do
					row('From'){ |res| res.user.profile.first_name + ' ' + res.user.profile.last_name }
					row('Date'){ |res| format_time(res.created_at) }
					row('Message'){ |res| res.message.to_s.html_safe }	
				end
			end
		end
    end
    
    panel "Signature" do
      attributes_table_for order do
        row :Seller do |r|
			if(r.seller.profile.digital_signature != '')
				image_tag(r.seller.profile.digital_signature, width: '200') + '<br/>'.html_safe + r.seller.profile.name
			end
		end
		row :Buyer do |r|
			if(r.user.profile.digital_signature != '')
				image_tag(r.user.profile.digital_signature, width: '200') + '<br/>'.html_safe + r.name
			end
		end
      end
    end
        
  end
end
