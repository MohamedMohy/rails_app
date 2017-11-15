class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= Student.find(session[:STUDENT_ID]) if session[:STUDENT_ID]
  end
  
    end
