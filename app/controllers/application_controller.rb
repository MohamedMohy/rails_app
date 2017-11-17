class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user,:logged_in?
  
  private
  
  def current_user
    @current_user ||= Student.find_by_STUDENT_ID(session[:STUDENT_ID]) if session[:STUDENT_ID]
  end

  def logged_in?
    !!current_user
  end

  def require_user
      if !logged_in?
        flash[:danger] = "you must be logged in "
        redirect_to root_path
      end
  end 
  
 
end 