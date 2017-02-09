ActiveAdmin.register BuyingRequestMoreDetail, :as => 'Information Request' do
  menu false
  actions :all, except: [:new, :destroy, :edit]
  action_item :back, only: :show do
    link_to "Back", admin_buying_request_path(params[:br_id]), method: :get
  end
  show do
    attributes_table do
      row :receiver      
      row 'Sender' do |mr|
        mr.user.email
      end
      row :subject
      row :message
      row :attachment do |mr|
        if mr.attachment.url.present?
          link_to mr.attachment.url.split('/').last, mr.attachment.url, target: :blank
        end
      end
      row :status
    end
  end

end
