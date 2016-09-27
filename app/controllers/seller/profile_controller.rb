class Seller::ProfileController < Seller::BaseController

  layout 'user'	

  def edit
  	@user = current_user
  	unless @user.image.present?
  		@user.build_image
  	end
  end

  def update
        
  	params[:user] ||= {'submit'=> true}
  	if params[:user] == {'submit'=> true}
	  	flash[:error] = "Image can't be blank."
	  end
  	@user = current_user
  	if (params[:user][:password].present? || params[:user][:password_confirmation].present?)
	  	if @user.update_with_password(user_params)
	      # Sign in the user by passing validation in case their password changed
	      sign_in @user, :bypass => true
	      flash[:notice] = "Password changed successfully."
	      redirect_to edit_seller_profile_path(current_user)
	    else
	     if (@user.errors.messages[:current_password].present? && @user.errors.messages[:current_password][0] == "is invalid")
	     	@old_error_msg = "Please enter correct old password."
	     end
	     if (@user.errors.messages[:password_confirmation].present? && @user.errors.messages[:password_confirmation][0] == "doesn't match Password")
	     	@new_error_msg = "Password confirmation doesn't match."
	     end
	      render 'edit'
	    end
	
	elsif (params[:is_digital_signature].present? && params[:is_digital_signature] == '1') 
	
		@user = Profile.find_by(id: params[:user][:profile_attributes][:id])
		@user.update(digital_signature: params[:profile][:digital_signature])
		
		flash[:notice] = "Digital signature successfully updated."
	    redirect_to edit_seller_profile_path(current_user)
	
	    
  	else
	  	if @user.update_attributes(user_params)
	  		if params[:commit] == "Done"
	  			unless @user.email == params[:user][:email]
	  				flash[:notice] = "Profile updated successfully.You will receive an email with instructions for how to confirm your new email address in a few minutes."
	  			else
	  				flash[:notice] = "Profile updated successfully."
	  			end
	  		elsif params[:commit] == "Update Profile"
	  			flash[:notice] = "Profile photo updated successfully."
	  		else
	  			flash[:notice] = "Successfully updated."
	  		end	
	      redirect_to edit_seller_profile_path(current_user)
	    else
	      render 'edit'
	    end
	  end
  end

  private
	def user_params
	 params.require(:user).permit(:email, :password, :password_confirmation,:current_password, :user_type, :profile_attributes => [ :first_name, :last_name, :company_name, :website, :phone_number, :country_id, :digital_signature ], :image_attributes => [:id,:image,:imageable_id,:imageable_type, :_destroy,:tmp_image])
	end
end
