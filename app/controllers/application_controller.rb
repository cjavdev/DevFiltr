class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_studen_id, :current_admin_id
  
  def current_student_id
    if current_or_guest_user.guest
      User.find_by_email("sample_student@devfiltr.io").id
    else
      current_user.id
    end
  end
  
  def current_admin_id
    if current_or_guest_user.guest
      User.find_by_email("sample_admin@devfiltr.io").id
    else
      current_user.id
    end
  end
end
