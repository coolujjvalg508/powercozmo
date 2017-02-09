ActiveAdmin.register BuyingProposal do
  menu false
  actions :all, except: [:new, :destroy, :edit]
  action_item :back, only: :show do
    link_to "Back", admin_buying_request_path(params[:br_id]), method: :get
  end
  controller do
    def download
      buying_proposal = BuyingProposal.find params[:id]
      send_file buying_proposal.attachment.path, :disposition => 'attachment'
    end
  end
  show do
    attributes_table do
      row :proposal
      row :price
      row :delivery_time
      row :currency do |bp|
        bp.currency.try(:symbol).try(:html_safe)
      end
      row :user_id
      row :status
      row :created_at
      row 'attachment' do |bp|
        if bp.attachment.present?
          if bp.attachment.file.extension.downcase == 'pdf'
            link_to bp.attachment.file.filename, :action => :download, :id =>bp.id
          else
            image_tag bp.attachment.url
          end
        else
          ' '
        end
      end
    end
  end

end
