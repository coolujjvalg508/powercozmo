ActiveAdmin.register User, :as => 'Seller' do
  menu label: 'Sellers', parent: 'Users', if: proc{ (current_admin_user.has_permission('seller_read') || current_admin_user.has_permission('seller_write') || current_admin_user.has_permission('seller_delete'))}

  permit_params :email, :email_confirmation, :password, :password_confirmation, :role, :user_type, profile_attributes: [:id, :first_name, :last_name, :company_name, :phone_number, :country_id, :website, :business_activity, :telephone, :job_title, :company_address, :company_telephone, :business_type] , image_attributes: [:id, :image, :imageable_id, :imageable_type, :image_cache]

  action_item :back, only: :show do
   link_to "Back", collection_path, method: :get
  end

  scope :active
  scope :inactive

  controller do
    def create
      unless params[:user][:image_attributes][:image].present?
        params[:user][:image_attributes][:image] = params[:user][:image_attributes][:image_cache]
        super
      else
        super
      end
    end
    def update
      unless params[:user][:image_attributes][:image].present?
        params[:user][:image_attributes][:image] = params[:user][:image_attributes][:image_cache]
      else
        params[:user][:image_attributes][:image]
      end
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      if params[:user][:email_confirmation].blank?
        params[:user].delete("email_confirmation")
      end
      super
    end

    def action_methods
      super
      if current_admin_user.role == 'super_admin'
        super
      else
        disallowed = []
        disallowed << 'index' if (!current_admin_user.has_permission('seller_read') && !current_admin_user.has_permission('seller_write') && !current_admin_user.has_permission('seller_delete'))
        disallowed << 'delete' unless (current_admin_user.has_permission('seller_delete'))
        disallowed << 'create' unless (current_admin_user.has_permission('seller_write'))
        disallowed << 'new' unless (current_admin_user.has_permission('seller_write'))
        disallowed << 'edit' unless (current_admin_user.has_permission('seller_write'))
        disallowed << 'destroy' unless (current_admin_user.has_permission('seller_delete'))
        super - disallowed
      end
    end
  end

  # Users List View
  index :download_links => ['csv'] do
    selectable_column
    column 'Name' do |user|
      user.try(:profile).try(:first_name)
    end
    column :email do |user|
      link_to user.try(:email), admin_seller_path(user)
    end
    column :created_at ,as: "Registered Date"
    column 'Image' do |user|
      image_tag user.try(:image).try(:image).try(:url, :thumb), height: 50, width: 50
    end
    column :user_type
    column 'Status' do |user|
      user.active? ? 'Active' : 'Inactive'
    end
    actions
  end

  csv do
    column :email
    column 'First Name' do |user|
      user.try(:profile).try(:first_name)
    end
    column 'Last Name' do |user|
      user.try(:profile).try(:last_name)
    end
    column 'Company Name' do |user|
      user.try(:profile).try(:company_name)
    end
    column 'Phone Number' do |user|
      user.try(:profile).try(:phone_number)
    end
    column 'Country' do |user|
      user.try(:profile).try(:country).try(:name)
    end
    column 'Website' do |user|
      user.try(:profile).try(:website)
    end
    column 'Business Activity' do |user|
      user.try(:profile).try(:business_activity)
    end
    column :sign_in_count
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column 'Status' do |user|
      user.active? ? 'Active' : 'Inactive'
    end
  end

  # Detail View
  show do
    attributes_table do
      row 'Name' do |user|
        user.try(:profile).try(:first_name)
      end
      row :email
      row 'Password' do |user|
        user.decrypted_password
      end
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :user_type
      row 'Status' do |user|
        user.active? ? 'Active' : 'Inactive'
      end
    end

    attributes_table do
      row 'First Name' do |user|
        user.try(:profile).try(:first_name)
      end
      row 'Last Name' do |user|
        user.try(:profile).try(:last_name)
      end
     
      row 'Phone Number' do |user|
        user.try(:profile).try(:phone_number)
      end
      row 'Telephone' do |user|
        user.try(:profile).try(:telephone)
      end

      row 'Job Title' do |user|
        user.try(:profile).try(:job_title)
      end

      row 'Company Name' do |user|
        user.try(:profile).try(:company_name)
      end
      row 'Website' do |user|
        user.try(:profile).try(:website)
      end

      row 'Company Address' do |user|
        user.try(:profile).try(:company_address)
      end

      row 'Company Telephone' do |user|
        user.try(:profile).try(:company_telephone)
      end

      row 'Business Type' do |user|
        user.try(:profile).try(:business_type)
      end

      row 'Business Activity' do |user|
        user.try(:profile).try(:business_activity)
      end
      row 'Country' do |user|
        user.try(:profile).try(:country).try(:name)
      end
      row :profile_picture do |user|
        unless !user.image.present?
          image_tag(user.try(:image).try(:image).try(:url, :medium))
        else
          image_tag('/assets/profile-noimage.jpg', height: '50', width: '50')
        end
      end
    end
  end

  # Filters
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :user_type, as: :select, collection: (User::USERTYPE)
  filter :active, as: :select, collection: [['Active',1], ['InActive', 0]], label: 'Status'
  filter :created_at

  # User New/Edit Form
  form multipart: true do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :email_confirmation
      f.input :password
      f.input :password_confirmation
      f.input :user_type, as: :select, collection: (User::USERTYPE), include_blank: 'Select User Type'
      f.input :active
      f.input :role, :as => :hidden, input_html: {value: 'seller'}
    end

    f.inputs "Profile Details",for: [:profile, f.object.profile || Profile.new] do |profile|
      profile.input :first_name
      profile.input :last_name
      profile.input :phone_number
      profile.input :telephone
      profile.input :job_title
      profile.input :company_name
      profile.input :company_address
      profile.input :website
      profile.input :company_telephone
      profile.input :country_id, as: :select, collection: Country.active.pluck(:name, :id), include_blank: 'Select Country', label: 'Country<abbr title="required">*</abbr>'.html_safe
      profile.input :business_type, as: :select, collection: (Profile::BUSINESS_TYPE), include_blank: 'Select Business Type'
      profile.input :business_activity
    end

    f.inputs "Profile Image", for: [:image, f.object.image || Image.new] do |image|
      image.input :image, as: :file, :hint => image_tag(f.object.try(:image).try(:image).try(:url, :thumb))
      image.input :image_cache, :as => :hidden
    end

    f.actions
  end

  batch_action "Update 'Status' for", form: { active: [['Active',1],['Inactive',0]] } do |ids, inputs|
    User.where(id: ids).update_all(active: inputs[:active])
    redirect_to collection_path, notice: "Status updated successfully"
  end
end
