class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] ? User.find(session[:user_id]) : nil
  end
  helper_method :current_user

  protected 
  def authorize_user
    if current_user
      return true
    else
      redirect_to login_path
      return false
    end
  end
end
