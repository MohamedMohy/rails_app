class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    def new
        @course =Course.new
        query = "SELECT * FROM departments"
        @departments = ActiveRecord::Base.connection.query(query)
    end

    def create
          connection = ActiveRecord::Base.connection
          @course =Course.new(course_params)
          query = "INSERT INTO courses (COURSE_NAME,COURSE_DESC,INSTRUCTOR_NAME,CREDIT_HOURS,Department_ID) VALUES 
          ('#{@course.COURSE_NAME}','#{@course.COURSE_DESC}','#{@course.INSTRUCTOR_NAME}','#{@course.CREDIT_HOURS}','#{@course.Department_ID}');"
          connection.execute(query)
          redirect_to action: "index"
    end

    def index
        query = "SELECT * FROM courses"
        @course= ActiveRecord::Base.connection.query(query)
    end

    def destroy
        query = "DELETE from courses where COURSE_ID = '#{@course.COURSET_ID}';"
        ActiveRecord::Base.connection.query(query)
        redirect_to action: "index"
    end

    def show 
    end

    def set_course
         @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:COURSE_NAME,:COURSE_DESC,:INSTRUCTOR_NAME,:CREDIT_HOURS,:Department_ID)
    end
end
