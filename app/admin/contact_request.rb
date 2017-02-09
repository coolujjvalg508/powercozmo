ActiveAdmin.register Contact, as: "Contact Request" do
	menu label: 'Contact Request', parent: 'CMS', if: proc{ current_admin_user.has_permission('contactrequest_read')}
	action_item :back, only: :show do
   	link_to "Back", collection_path, method: :get
  end

  actions :index,:show,:destroy

  controller do
  	def send_reply
  		contact_request = Contact.find(params[:id])
  		ContactRequestMailer.delay.reply(contact_request, params[:reply][:body])
  		contact_request.update_attribute(:status, "Replied")
  		redirect_to :back, notice: "Your reply has been sent to enquirier."
  	end
  end
  index do
		selectable_column
		column :id do |cr|
			link_to cr.id, admin_contact_request_path(cr)
		end
		column :first_name
		column :last_name
		column :email
		column :phone
		column :subject do |cr|
			truncate(cr.subject, length: 50)
		end
		column :message do |cr|
			truncate(cr.message, length: 50)
		end
		column :received_at do |cr|
			cr.created_at
		end
		actions
	end

	show title: 'Contact Request Detail' do |cr|
    render partial: "contact_detail", locals: {cr: cr}
  end

	filter :id
	filter :first_name
	filter :last_name
	filter :email
	filter :phone
	filter :subject
	filter :message
	filter :created_at, label:"Received At"

end