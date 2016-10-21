class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  
  def new
  
    @page_content_data = PageContentManagement.where(:page_url => "sign_up")
	@content_data = {}
	@page_content_data.each do |v|		
		@content_data[v.page_section] = v.content		
	end
  
    build_resource({})
    resource.build_profile
    respond_with self.resource
        
  end

  # POST /resource
  def create
	
	@page_content_data = PageContentManagement.where(:page_url => "sign_up")
	@content_data = {}
	@page_content_data.each do |v|		
		@content_data[v.page_section] = v.content		
	end		
  
    build_resource(sign_up_params)
		params[:user][:profile] = sign_up_params["profile_attributes"]
           
    if simple_captcha_valid?
		super
    else
		@captcha_error = "Please enter correct captcha"
      
		render action: 'new'
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
	root_path
    #new_user_session_path
    # super(resource)
  end
end
