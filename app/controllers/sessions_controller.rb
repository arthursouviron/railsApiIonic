class SessionsController < Devise::SessionsController
  respond_to :json
  # POST /resource/sign_in
  skip_before_filter :require_no_authentication, :only => [:new, :create]
   
  def isAuth
    authenticate_user_from_token!
    render :json => {
      :success => true,
      :user => current_user,
      :status => :ok,
    }
  end
  
  def create
   self.resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#failure")
   sign_in(resource_name, resource)
 
   current_user.update authentication_token: nil
 
   respond_to do |format|
    format.json {
      render :json => {
        :success => true,
        :user => current_user,
        :status => :ok,
        :avatar_url => current_user.avatar.url
      }
    }

   end
  end
  
  def failure
    return render json: { success: false, errors: ['Login information is incorrect, please try again'] }
  end

  # DELETE /resource/sign_out
  def destroy

   current_user = User.find_by_email(params[:user_email])

   respond_to do |format|
    format.json {
      if current_user
        current_user.update authentication_token: nil
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        render :json => {}.to_json, :status => :ok
      else
        render :json => {}.to_json, :status => :unprocessable_entity
      end
    }
    format.html {
     if current_user
        current_user.update authentication_token: nil
        signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
        redirect_to :root
     end
    }
   end
  end
end