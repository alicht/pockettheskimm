class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def require_authenticate
    if session[:access_token].nil? 
        redirect_to root_path, notice: "You need to be signed in." 
    end
  end

end
