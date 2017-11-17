class SessionsController < ApplicationController
  def new
  end
  def create
    yallashoot= Digest::MD5.hexdigest(params[:PASSWORD])
    puts yallashoot
    puts params[:PASSWORD]
    student = Student.authenticate(params[:USERNAME], yallashoot)
    if student
      session[:STUDENT_ID] = student.STUDENT_ID
      flash[:sucess]="you logged in"
      redirect_to student_path(student)
      
    else
      flash.now.alert = "Invalid email or password"
       redirect_to action: "new"
    end
  end
  
  def destroy
    session[:STUDENT_ID] = nil
    redirect_to root_path, :notice => "Logged out!"
  end
end
  
