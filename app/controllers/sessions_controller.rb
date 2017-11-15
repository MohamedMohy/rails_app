class SessionsController < ApplicationController
  def new
  end
  def create
    student = Student.authenticate(params[:USERNAME], params[:PASSWORD])
    if student
      session[:STUDENT_ID] = student.STUDENT_ID
      redirect_to new_student_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
       redirect_to action: "index"
    end
  end
  
  def destroy
    session[:STUDENT_ID] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
  
