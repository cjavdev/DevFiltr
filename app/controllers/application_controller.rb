class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_student, :current_admin
  
  def current_student
    if current_or_guest_user.guest
      User.find_by_email("sample_student@devfiltr.io")
    else
      current_user
    end
  end
  
  def current_admin
    if current_or_guest_user.guest
      User.find_by_email("sample_admin@devfiltr.io")
    else
      current_user
    end
  end
end
