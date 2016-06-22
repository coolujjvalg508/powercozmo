ActiveAdmin.register EquipmentEnquiry do
	config.sort_order = 'read_by_admin_asc_and_updated_at_desc' #more detail in multiple column sort initializer
	menu label: 'Manage Enquiries', if: proc{ (current_admin_user.has_permission('equipmentenquiry_read') || current_admin_user.has_permission('equipmentenquiry_write') || current_admin_user.has_permission('equipmentenquiry_delete'))}

	permit_params :name, :email, :mobile, :country_id, :enquiry_type, :equipment_id, :company_name, :company_website, :message, :bidding_price, :status, :replied_as, :response

	action_item :back, only: :show do
		links = ""
   	links = link_to "Back", collection_path, method: :get
	  if (equipment_enquiry.status != 'Approved' && equipment_enquiry.equipment.availble_for >= Date.today)
	  	links += link_to "Approve Enquiry", admin_approve_enquiry_request_path(id: equipment_enquiry.id), method: :get, :style => "float:left;margin-left: 25%"
	  elsif (equipment_enquiry.status != 'Approved' && equipment_enquiry.equipment.availble_for < Date.today )
	  	links += "<p style='color:red;position: absolute;top: 80px;'>You can't approve this enquiry as this equipment is expired.</p>".html_safe
	  end
   	links
  end

  controller do
  	def approve_enquiry
  		begin
        equipment_enquiry = EquipmentEnquiry.find(params[:id])
        equipment_enquiry.status = "Approved"
        equipment_enquiry.save!
        redirect_to admin_equipment_enquiry_path(equipment_enquiry.id), notice: 'Enquiry is approved'
      rescue Exception => e
      	redirect_to admin_equipment_enquiry_path(equipment_enquiry.id), notice: e.message
      end
  	end

  	def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('equipmentenquiry_read') && !current_admin_user.has_permission('equipmentenquiry_write') && !current_admin_user.has_permission('equipmentenquiry_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('equipmentenquiry_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('equipmentenquiry_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('equipmentenquiry_delete'))
        super - disallowed
      end
    end

    def show
    	super do
    		resource.mark_as_read(current_admin_user)
    	end
    end
  end

  index row_class: ->elem { 'unread' unless elem.is_read_by_admin? } do
		selectable_column
		column :enquirer_name do |ee|
			ee.name
		end
		column :type do |ee|
			ee.enquiry_type.capitalize
		end
		column :equipment do |ee|
			link_to ee.equipment.name, admin_equipment_path(ee.equipment_id)
		end
		column :seller do |ee|
			link_to ee.equipment.user.name, admin_seller_path(ee.equipment.user)
		end
		column :offered_price do |ee|
			(ee.bidding_price || ee.equipment.price) if ee.enquiry_type != "question"
		end
		column :enquirer_location do |ee|
			ee.try(:country).try(:name)
		end
		column "Admin Approved" do |ee|
			(ee.status == "Disapproved" || ee.status == "New") ? "No" : "Yes"
		end
		column "Seller Response" do |ee|
			if (ee.enquiry_type == "question" && ee.response.present?)
				"<p title='#{strip_tags(ee.response.to_s.gsub(/'/,""))}'>#{truncate(strip_tags(ee.response), length:50)}</p>".html_safe
			else
				"<p title='#{ee.replied_as}'>#{ee.replied_as}</p>".html_safe
			end
		end
		column :created_at
		actions
	end

	show do
		attributes_table do
			row "Expairy_date" do |a|
				a.equipment.availble_for
			end
			row :equipment
      row :enquiry_type do |ee|
				ee.enquiry_type.capitalize
			end
			row :message
			row :price do |ee|
				ee.bidding_price || ee.equipment.price
			end
			row :buyer_name do |ee|
				ee.name
			end
			row :buyer_email do |ee|
				ee.email
			end
			row :buyer_mobile do |ee|
				ee.mobile
			end
			row :buyer_country do |ee|
				ee.country.name
			end
			row :buyer_company_name do |ee|
				ee.company_name
			end
			row :buyer_company_website do |ee|
				ee.company_website
			end
			row "Admin Approved" do |ee|
			(ee.status == "Disapproved" || ee.status == "New") ? "No" : "Yes"
		end
      row :created_at
      row :updated_at
    end

		panel "Response from seller", class: 'sub-panel1' do
			attributes_table do
				row " ", class: 'ee-info' do |equipment_enquiry|
					table :style => 'width:100%;margin:-11px' do
						tr do
	            th :style => 'font-weight:bolder' do
	              "Response"
	            end
	            if equipment_enquiry.enquiry_type != "question"
	            	th :style => 'font-weight:bolder;text-align:center' do
		              "Response Type"
		            end
	            end
	            th :style => 'font-weight:bolder;text-align:center' do
	              "Status"
	            end
	          end
	          equipment_enquiry.responses.each do |enquiry_response|
		          tr do
		          	td :width=>'80%',style: "word-break:break-all" do
		          		enquiry_response.message.to_s.html_safe
		          	end
		          	if equipment_enquiry.enquiry_type != "question"
		            	td :style => 'text-align:center' do
			              equipment_enquiry.replied_as
			            end
		            end
		          	td :style => 'text-align:center' do
		          		if enquiry_response.status == 'forwarded'
		          			"Forwarded"
		          		else
		          			if equipment_enquiry.equipment.availble_for >= Date.today
		          				link_to "Edit and forward", edit_admin_enquiry_response_path(enquiry_response)
		          			else
		          				"<p style='color:red;'>You can't forward this enquiry response as this equipment is expired.</p>".html_safe
		          			end
		          		end
		          	end
		          end
		        end
					end
				end
			end
		end
	end

	filter :name, label: "Buyer Name"
	filter :enquiry_type, as: :select, collection: [['Question','1'], ['Bid','2'], ['Buy','3']]
	filter :equipment
	filter :bidding_price, label: "Price", as: :numeric
	filter :country
	filter :status, as: :select, collection: [['New','1'], ['Approved','2'], ['Disapproved','3']]
	filter :created_at

	batch_action "Update 'Status' for", form: { status: [['New','1'],['Approved','2'], ['Disapproved', '3']] } do |ids, inputs|
    EquipmentEnquiry.where(id: ids).update_all(status: inputs[:status])
    redirect_to collection_path, notice: "Status updated successfully"
  end
end