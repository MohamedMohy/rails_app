class StudentsController < ApplicationController
    before_action :set_student, only: [:show, :edit, :update, :destroy]
    def new
        @student = Student.new
    end

    def create
        connection = ActiveRecord::Base.connection
        @student =Student.new(student_params)
        @student.REGDATE = Time.now
        yallashoot = Digest::MD5.hexdigest(@student.PASSWORD)
        puts yallashoot
        query ="INSERT INTO students (USERNAME,PASSWORD,EMAIL,REGDATE) VALUES 
        ('#{@student.USERNAME}','#{@student.PASSWORD}','#{@student.EMAIL}','#{@student.REGDATE}');"
        #begin
            connection.execute(query)
       # rescue => exception
            #redirect_to action: "index"
            flash[:notice] = "Duplicate USERNAME or EMAIL !!"
       # end
        redirect_to action: "index"
    end

    def show 
        query = 'SELECT * FROM departments'
        @departments = ActiveRecord::Base.connection.query(query)
    end

    def change_dep_id
        department = Department.find_by_department_id(params[:foo_param])
        stude = Student.find_by_STUDENT_ID(params[:stud_param])
        connection = ActiveRecord::Base.connection
        query="UPDATE students SET Department_ID = #{params[:foo_param]} WHERE STUDENT_ID = '#{params[:stud_param]}';"
        connection.execute(query)
        redirect_to action: "index"
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
