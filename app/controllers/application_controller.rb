class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #   private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_authenticate
    if current_user.nil? 
        redirect_to root_path, notice: "You need to be signed in."
        # flash[:notice] = "You need to sign in."
        # redirect_to root_path   
    end
  end
  
end
