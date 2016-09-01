ActiveAdmin.register BuyingRequest do
	config.sort_order = 'read_by_admin_asc_and_updated_at_desc' #more detail in multiple column sort initializer

	menu label: 'Buying Requests', if: proc{ (current_admin_user.has_permission('buyingrequest_read') || current_admin_user.has_permission('buyingrequest_write') || current_admin_user.has_permission('buyingrequest_delete'))}

	permit_params :title, :origin, :location_id, :brand_id, :category_id, :lead_type, :condition, :expiration_date, :attachment, :end_user, :city, :image, :description, :name, :email, :mobile, :country_id, :company_name, :company_website, :address, :status, :images_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image,:image_cache]

  action_item :back, only: :show do
		links = ""
   	links = link_to "Back", collection_path, method: :get
	  if (buying_request.status == 'New' && buying_request.expiration_date >= Date.today )
	  	links += link_to "Approve Buying Request", admin_accept_request_path(id: buying_request.id), method: :get, :style => "float:left;margin-left: 25%"
	  elsif (buying_request.status != 'Approved' && buying_request.expiration_date < Date.today )
	  	links += "<p style='color:red;position: absolute;top: 80px;'>You can't approve this buying request as this is expired.</p>".html_safe
	  end
   	links
  end

  controller do
  	def accept_request
      begin
        buying_request = BuyingRequest.find(params[:id])
        prev_status = buying_request.status
        buying_request.status = "Approved"
        buying_request.save!
        if prev_status == "New"
	  			BuyingRequestMailer.delay.send_admin_approved_buying_request_email_to_seller(buying_request)
        end
        redirect_to admin_buying_request_path(buying_request.id), notice: 'Buying request is approved'
      rescue Exception => e
      	redirect_to admin_buying_request_path(buying_request.id), notice: e.message
      end
    end

    def scoped_collection
      resource_class.includes(:buying_request_more_details)
    end

    def edit_and_accept_proposal
    	@buying_proposal = BuyingProposal.find(params[:proposal_id])
    end

    def update_and_accept_proposal
      @buying_proposal = BuyingProposal.find(params[:proposal_id])
      @buying_proposal.update(proposal_params)
      @buying_proposal.status = "Approved"
      if @buying_proposal.save
      	redirect_to admin_buying_request_path(params[:id]), notice: 'Buying proposal is approved'
      else
      	render 'edit_and_accept_proposal'
      end
    end

    def edit_and_accept_info_request
    	@info_request = BuyingRequestMoreDetail.find(params[:info_request_id])
    end

    def update_and_accept_info_request
      @info_request = BuyingRequestMoreDetail.find(params[:info_request_id])
      @info_request.update(info_request_params)
      @info_request.status = "Approved"
      if @info_request.save
      	redirect_to admin_buying_request_path(params[:id]), notice: 'Information request is forwarded'
      else
      	render 'edit_and_accept_info_request'
      end
    end

    def create
    	if (params[:buying_request].present? && params[:buying_request][:images_attributes].present?)
        params[:buying_request][:images_attributes].each do |index,img|
          unless params[:buying_request][:images_attributes][index][:image].present?
            params[:buying_request][:images_attributes][index][:image] = params[:buying_request][:images_attributes][index][:image_cache]
          end
        end
        super
      else
        super
      end
    end

    def update
    	if (params[:buying_request].present? && params[:buying_request][:images_attributes].present?)
        params[:buying_request][:images_attributes].each do |index,img|
          unless params[:buying_request][:images_attributes][index][:image].present?
            params[:buying_request][:images_attributes][index][:image] = params[:buying_request][:images_attributes][index][:image_cache]
          end
        end
        super
      else
        super
      end
    end

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('buyingrequest_read') && !current_admin_user.has_permission('buyingrequest_write') && !current_admin_user.has_permission('buyingrequest_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('buyingrequest_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('buyingrequest_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('buyingrequest_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('buyingrequest_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('buyingrequest_delete'))
        super - disallowed
      end
    end

    def show
    	super do
    		resource.mark_as_read(current_admin_user)
    	end
    end

    private
	  def info_request_params
	    params.require(:buying_request_more_detail).permit(:id, :subject, :message, :attachment)
	  end

	  def proposal_params
	    params.require(:buying_proposal).permit(:id, :price, :currency_id, :delivery_time, :attachment,:proposal, image_attributes: [:id, :image, :imageable_id, :imageable_type, :image_cache])
	  end
  end

	index :download_links => ['csv'], row_class: ->elem { 'unread' unless elem.is_read_by_admin? } do
		selectable_column
		column :title do |br|
			link_to br.title, admin_buying_request_path(br)
		end
		column "Serial Number", :identifier
		column :image do |br|
			image_tag br.try(:images).try(:first).try(:image).try(:url, :thumb), height: 50, width: 50
		end
		column :lead_type
		column :expiration_date
		column :status
		column :created_at
		actions
	end
	csv do
		column :title
    column "Serial Number" do |br|
    	br.identifier
    end
    column :origin
    column :brand do |br|
    	br.try(:brand).try(:name)
    end
    column :category do |br|
    	if br.category
    		br.category.name
    	else
    		br.category_name
    	end
    end
		column :lead_type
		column :condition
    column :attachment do |br|
    	if br.attachment.present?
    		request.host+br.attachment.url
    	end
    end
		column :expiration_date
		column :end_user
		column :city
    column :location do |br|
    	Country.find_by_id(br.location_id).try(:name)
    end
		column :description
		column :status
    column 'Image' do |br|
      image_url(br.try(:images).try(:first).try(:image).try(:url))
    end
    column "Buyer name" do |br|
    	br.name
    end
		column :email
		column :mobile
    column "Buyer country" do |br|
    	br.try(:country).try(:name)
    end
		column :company_name
		column :company_website
		column :address
    column :created_at
  end

	filter :title
	filter :identifier, label: "Serial Number"
	filter :lead_type
	filter :condition
	filter :expiration_date
	filter :end_user
	filter :city
	filter :description
	filter :name
	filter :email
	filter :company_name
	filter :company_website
	filter :address
	filter :status, as: :select, collection: ['New', 'Approved', 'Rejected']

	# User New/Edit Form
  form multipart: true do |f|
    f.inputs "Buying Request Details" do
	    f.input :title
	    f.input :origin
	    f.input :brand_id, as: :select, collection: Manufacturer.pluck(:name, :id), include_blank: 'Select Brand'
	    f.input :category_id, as: :select, collection: Category.active.pluck(:name, :id), include_blank: 'Select Category', label: 'Category<abbr title="required">*</abbr>'.html_safe
	    f.input :lead_type, as: :select, collection: BuyingRequest::LEAD_TYPES, include_blank: 'Select Lead type'
	    f.input :condition, as: :select, collection: BuyingRequest::CONDITIONS, include_blank: 'Select Condition'

	    f.input :attachment, :hint => (f.object.try(:attachment).try(:url).try(:split, '/').try(:last)), label: 'Attach PDF File'
	    f.input :expiration_date, :as => :datepicker
	    f.input :end_user
	    f.input :city
	    f.input :location_id, as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country', label: 'Country'
	    f.input :description
	    # f.input :image, :hint => image_tag(f.object.try(:image).try(:url, :thumb)), label: 'Photo'
	    f.inputs 'Images' do
        f.has_many :images, allow_destroy: true, new_record: true do |ff|
          ff.input :image, as: :file, label: "Image", hint: ff.template.image_tag(ff.object.image.try(:url), style: ff.object.image.present? ? "height: 160px;" : "")
          ff.input :image_cache, :as => :hidden
        end
      end
    end
    f.inputs "Buyer Details" do
	    f.input :name
	    f.input :email
	    f.input :mobile
	    f.input :country_id, as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country'
	    f.input :company_name
	    f.input :company_website
	    f.input :address, as: :text
	    if controller.action_name != 'edit'
	    	f.input :status, as: :hidden, input_html: {value: 'New'}
	    end
    end

    f.actions
  end

  # Detail View
  show do
    attributes_table do
      row :title
      row "Serial Number" do
      	buying_request.identifier
      end
      row :origin
      row :brand
      row :category do |br|
      	if br.category
      		link_to br.category.name, admin_category_path(br.category)
      	else
      		br.category_name
      	end
      end
			row :lead_type
			row :condition
      row :attachment do |br|
      	if br.attachment.present?
      		link_to br.attachment.url.to_s.split('/').last, br.attachment.url, target: :blank
      	end
      end
			row :expiration_date
			row :end_user
			row :city
      row :location
			row :description
			row :status
      row :created_at
      row 'Images' do
        ul class: "image-blk" do
        	if buying_request.images.present?
	          buying_request.images.each do |img|
	            span do
	              image_tag(img.try(:image).try(:thumb).try(:url), class: "show-img")
	            end
	          end
	        end
        end
      end
    end

		panel "Buyer Information", class: 'sub-panel1' do
			attributes_table do
		  	row :name
				row :email
				row :mobile
	      row :country
				row :company_name
				row :company_website
				row :address
			end
		end

		panel "Seller Proposals", class: 'sub-panel2' do
			attributes_table do
				row " ", class: 'br-info' do |buyer_request|
		      if buyer_request.buying_proposals.present?
		        buying_proposals = buyer_request.buying_proposals
		        table :style => 'width:100%;margin:-10px' do
		          tr do
		            th :style => 'font-weight:bolder' do
		              "Seller Name"
		            end
		            th :style => 'font-weight:bolder' do
		              "Seller Email"
		            end
		            th :style => 'font-weight:bolder' do
		              "Price"
		            end
		            th :style => 'font-weight:bolder' do
		              "Currency"
		            end
		            th :style => 'font-weight:bolder' do
		              "Delivery Time"
		            end
		            th :style => 'font-weight:bolder' do
		              "Proposal"
		            end
		            th :style => 'font-weight:bolder' do
		              "Attachment"
		            end
		            th :style => 'font-weight:bolder' do
		              "Status"
		            end
		          end
		          buying_proposals.each do |bp|
		          	tr do
		              td do
		                bp.user.try(:name)
		              end
		              td do
		                link_to bp.try(:user).try(:email), admin_seller_path(bp.try(:user).try(:id))
		              end
		              td do
		                bp.price
		              end
		              td do
		                bp.currency.try(:symbol).try(:html_safe)
		              end
		              td do
		                bp.delivery_time
		              end
		              td do
		                link_to truncate(bp.proposal, length: 100), admin_buying_proposal_path(bp.id, br_id: buyer_request.id)
		              end
		              td do
		              	if bp.attachment.present?
		              		if bp.attachment.file.extension.downcase == 'pdf'
			              		link_to bp.attachment.file.filename, admin_download_proposal_attachemnt_path(:id =>bp.id)
			              	else
		                		image_tag bp.attachment.url, height: 50, width: 50
			              	end
			              else
			              	' '
			              end
		              end

		              td do
		              	if bp.status == 'New'
		              		if bp.buying_request.expiration_date >= Date.today
		                		link_to 'Forward', admin_edit_and_accept_proposal_path(proposal_id: bp.id, id: buyer_request.id)
		                	else
		                		"<p style='color:red;'>You can't forward this proposal as this buying request is expired.</p>".html_safe
		                	end
		              	else
		              		'Forwarded'
		              	end
		              end

		            end
		          end
		        end
		      end
		    end
		  end
		end

		panel "More Information Requests", class: 'sub-panel3' do
		  attributes_table do
				row " ", class: 'br-info' do |buyer_request|
		      if buyer_request.more_info_requests.present?
		        more_info_requests = buyer_request.more_info_requests
		        table :style => 'width:100%;margin:-10px' do
		          tr do
		            th :style => 'font-weight:bolder' do
		              "Seller Name"
		            end
		            th :style => 'font-weight:bolder' do
		              "Seller Email"
		            end
		            th :style => 'font-weight:bolder' do
		              "Subject"
		            end
		            th :style => 'font-weight:bolder' do
		              "Body"
		            end
		            th :style => 'font-weight:bolder' do
		              "Attachment"
		            end
		            th :style => 'font-weight:bolder' do
		              "Requested At"
		            end
		            th :style => 'font-weight:bolder' do
		              "Status"
		            end
		          end
		          more_info_requests.each do |mr|
		            tr do
		              td do
		              	mr.user.try(:name)
		              end
		              td do
		                link_to mr.try(:user).try(:email), admin_seller_path(mr.try(:user).try(:id))
		              end
		              td do
		                link_to mr.subject, admin_information_request_path(mr, br_id: buyer_request.id)
		              end
		              td do
		                truncate strip_tags(mr.message), length: 100
		                # mr.message.html_safe
		              end
		              td style: 'padding-left: 35px;' do
		              	if mr.attachment.present?
			              	link_to image_tag('/assets/attachment-icon.png'), mr.attachment.url, target: :blank
			              else
			              	' '
			              end
		              end
		              td do
		                mr.created_at.strftime('%m-%d-%Y %M:%H %p')
		              end
		              td do
		              	if mr.status == 'New'
		              		if mr.buying_request.expiration_date >= Date.today
		                		link_to 'Forward', admin_edit_and_accept_info_request_path(info_request_id: mr.id, id: buyer_request.id)
		              		else
		                		"<p style='color:red;'>You can't forward this info request as this buying request is expired.</p>".html_safe
		                	end
		              	else
		              		'Forwarded'
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

  batch_action "Update 'Status' for", form: { status: [['Approved','Approved'], ['Rejected', 'Rejected']] } do |ids, inputs|
  	unless inputs[:status] == "Approved"
	    BuyingRequest.where(id: ids).update_all(status: inputs[:status])
	    redirect_to collection_path, notice: "Status updated successfully"
	  else
	  	# BuyingRequest.where("id IN (?) AND expiration_date >= ?", ids, Date.today).update_all(status: inputs[:status])
	  	buying_requests = BuyingRequest.where("id IN (?) AND expiration_date >= ?", ids, Date.today)
	  	buying_requests.each do |br|
	  		br_status = br.status
	  		br.update_attributes(status: inputs[:status])
	  		if br_status == 'New'
	  			BuyingRequestMailer.delay.send_admin_approved_buying_request_email_to_seller(br)
	  		end
	  	end
	  	br_from_ids = BuyingRequest.where("id IN (?)", Date.today).size
	  	if buying_requests.size < br_from_ids
	  		notice_text = "Few records has not been updated with the requested status due to expiration date."
	  	else
	  		notice_text = "Status updated successfully"
	  	end
	  	redirect_to collection_path, notice: notice_text
  	end
  end
end
