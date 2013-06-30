class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    unless logged_in?
      redirect_to new_session_url
    end
  end
  
  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end
  
  def logged_in?
    !!current_user
  end
end
