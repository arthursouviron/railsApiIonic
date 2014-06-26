class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  after_filter :set_access_control_headers

  #protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*' 
    headers['Access-Control-Request-Method'] = '*' 
  end



  # def cor
  #   headers["Access-Control-Allow-Origin"] = "*"
  #   headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE OPTIONS}.join(",")
  #   headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
  #   head(:ok) if request.request_method == "OPTIONS"
  # end

end
