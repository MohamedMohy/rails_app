class StudentsController < ApplicationController

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(params[student_params])
        if @student.save
            flash[:notice] ="yes successfully signed up"
            flash[:color]="valid"
                       
        else
            flash[:notice] ="opps invalid"
            flash[:color] ="invalid"
        end
        render "new"
    end

    def student_params
        params.require(:student).permit(:STUDENT_ID,:USERNAME,:PASSWORD,:EMAIL,:REGDATE,:Department_ID)
    end


end
