class ApplicationController < ActionController::Base
  include SimpleCaptcha::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper Bootsy::Engine.helpers
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && (action_name == 'create' || action_name == 'destroy')}
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_message, if: -> { controller_name == 'sessions' && action_name == 'new'}
  before_action :check_admin, if: -> { controller_path =~ /admin/ && controller_name != 'sessions' && controller_name != 'passwords'}
  around_filter :with_timezone

  def configure_permitted_parameters
  
	if params[:controller] == 'devise/passwords'
	
		@page_content_data = PageContentManagement.where(:page_url => "forgot_password")
		@content_data = {}
		@page_content_data.each do |v|		
			@content_data[v.page_section] = v.content		
		end
	end
	
    if params[:user].present? &&  params[:user][:profile].present?
      params[:user][:profile_attributes] = params[:user][:profile]
    end
    if params[:user].present? &&  params[:user][:image].present?
      params[:user][:image_attributes] = params[:user][:image]
    end
    devise_parameter_sanitizer.for(:sign_up).push(:email, :password, :password_confirmation,:email_confirmation,:terms_of_service,:captcha, :captcha_key, :user_type, :profile_attributes => [:id,:first_name,:last_name,:company_name,:phone_number,:country_id,:website,:business_activity,:category_id], :image_attributes => [:id,:image])
    # devise_parameter_sanitizer.for(:account_update).push(:username, :email, :date_of_birth, :current_password, :password, :password_confirmation)
  end

  def after_sign_in_path_for(resource)
 
	#abort(resource.to_json)
  
    if resource.is_a?(AdminUser)
      admin_root_path
    else        
		stored_location_for(resource) || seller_dashboard_path || root_path
    end
  end

  def set_message
    if params[:guest_user] == "true"
      flash[:error] = "Please Login to Read more about Buying Request."
    end
  end
  private
    def check_admin
      unless current_admin_user.present?
        redirect_to new_admin_user_session_path
      end
    end

    def with_timezone(&block)
      timezone = Time.find_zone(cookies[:timezone])
      Time.use_zone(timezone, &block)
    end
end
