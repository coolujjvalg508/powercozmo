ActiveAdmin.register Commission do
	menu label: 'Manage Commissions', parent: 'Orders', if: proc{ (current_admin_user.has_permission('commission_read') || current_admin_user.has_permission('commission_write') || current_admin_user.has_permission('commission_delete'))}

	actions :all, except: [:new, :create]

	permit_params :min_price, :max_price, :percent, :status, :name

	batch_action "Update 'Status' for", form: { status: Commission.statuses.map{|status, value| [status.to_s.humanize, value] } } do |ids, inputs|
	  Commission.where(id: ids).update_all(status: inputs[:status])
	  redirect_to collection_path, notice: "Status updated successfully"
	end

	action_item :back, only: :show do
		link_to "Back", collection_path, method: :get
	end

	controller do 
    def action_methods
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('commission_read') && !current_admin_user.has_permission('commission_write') && !current_admin_user.has_permission('commission_delete'))
        disallowed << 'show' if (!current_admin_user.has_permission('commission_read') && !current_admin_user.has_permission('commission_write') && !current_admin_user.has_permission('commission_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('commission_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('commission_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('commission_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('commission_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('commission_delete'))
        super - disallowed
      end
    end
  end

	index do
		selectable_column
		column :name
		column :minimum_price do |commission|
			number_with_precision(commission.min_price, precision: 2, strip_insignificant_zeros: true)
		end
		column :maximum_price do |commission|
			number_with_precision(commission.max_price, precision: 2, strip_insignificant_zeros: true)
		end
		column :percent_of_commission do |commission|
			number_to_percentage(commission.percent, precision: 2, strip_insignificant_zeros: true)
		end
		column :status do |commission|
			commission.status.capitalize
		end
		column :created_at
		actions
	end

	filter :name
	filter :min_price
	filter :max_price
	filter :percent
	filter :status, as: :select, collection: [['active', '1'], ['inactive', '0']]
	filter :created_at

	show do
    attributes_table do
    	row :name
      row :minimum_price do |commission|
      	number_with_precision(commission.min_price, precision: 2, strip_insignificant_zeros: true)
      end
      row :maximum_price do |commission|
      	number_with_precision(commission.max_price, precision: 2, strip_insignificant_zeros: true)
      end
      row :percent do |commission|
      	number_to_percentage(commission.percent, precision: 2, strip_insignificant_zeros: true)
      end
      row :status do |commission|
      	commission.status.capitalize
      end
      row :updated_at
      row :created_at
		end
	end
end