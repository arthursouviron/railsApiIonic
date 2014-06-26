class SessionsController < Devise::SessionsController
  respond_to :json
  # POST /resource/sign_in
  # 
  skip_before_filter :verify_authenticity_token
  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers 
  
  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*' 
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE OPTIONS}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  def cors_preflight_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
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
        :authentication_token => current_user.authentication_token
      }
    }
    format.html {
      redirect_to :root
    }

   end
  end
  
  def failure
    return render json: { success: false, errors: ['Login information is incorrect, please try again'] }
  end

  # DELETE /resource/sign_out
  def destroy
 
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