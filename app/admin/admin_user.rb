ActiveAdmin.register AdminUser, :as => 'Super Admin' do
  menu false
  permit_params :email, :password, :password_confirmation, :name, :active, image_attributes: [:id, :image, :imageable_id, :imageable_type, :image_cache]
  config.clear_action_items!
  actions :all, except: [:new, :destroy, :index]
  action_item only: :show do
    link_to 'Edit Profile', edit_admin_super_admin_path
  end
  action_item :back, only: :show do
    link_to "Back", admin_dashboard_path, method: :get
  end

  collection_action :notifications, method: :get do    
    respond_to do |format|
      format.js
    end
  end

  controller do
    def create
      unless params[:admin_user][:image_attributes][:image].present?
        params[:admin_user][:image_attributes][:image] = params[:user][:image_attributes][:image_cache]
        super
      else
        super
      end
    end
    def update
      unless params[:admin_user][:image_attributes][:image].present?
        params[:admin_user][:image_attributes][:image] = params[:admin_user][:image_attributes][:image_cache]
      else
        params[:admin_user][:image_attributes][:image]
      end
      super
    end
  end

  show do
    attributes_table do
      row :email
      row :name
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :role
      row "Status" do |user|
        user.try(:active) ? 'Active' : 'Inactive'
      end
      row :profile_picture do |admin_user|
        if admin_user.image.present?
          image_tag(admin_user.try(:image).try(:image).try(:url, :medium))
        else
          image_tag('/assets/profile-noimage.jpg', height: '50', width: '50')
        end
      end
    end
  end
  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Profile Image", for: [:image, f.object.image || Image.new] do |image|
      image.input :image, as: :file, :hint => image_tag(f.object.try(:image).try(:image).try(:url, :thumb))
      image.input :image_cache, :as => :hidden
    end
    f.submit "Update profile"
  end
end
