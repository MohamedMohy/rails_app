class StudentsController < ApplicationController
    # before_filter :save_login_state, :only => [:new, :create]
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def new
        @student = Student.new
    end

    def create
        connection = ActiveRecord::Base.connection
        @student =Student.new(student_params)
        @student.REGDATE = Time.now
        query ="INSERT INTO students (USERNAME,PASSWORD,EMAIL,REGDATE) VALUES 
        ('#{@student.USERNAME}','#{@student.PASSWORD}','#{@student.EMAIL}','#{@student.REGDATE}');"
        begin
            connection.execute(query)
        rescue => exception
            #redirect_to action: "index"
            flash[:notice] = "Duplicate USERNAME or EMAIL !!"
        end
        redirect_to action: "index"
    end

    def show 
    end

    def update 
    end

    def index
        query = "SELECT * FROM students"
        @students= ActiveRecord::Base.connection.query(query)
        
    end

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:USERNAME,:PASSWORD,:EMAIL)
    end

    def destroy
        query = "DELETE from students where STUDENT_ID = '#{@student.STUDENT_ID}';"
        ActiveRecord::Base.connection.query(query)
        redirect_to action: "index"

    end



end
