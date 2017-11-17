class DepartmentsController < ApplicationController

    before_action :set_department, only: [:show, :edit, :update, :destroy]
  def new
      @department =Department.new
  end
  def create
    connection = ActiveRecord::Base.connection
      @department =Department.new(department_params)
      query = "INSERT INTO departments (DEPARTMENT_NAME,DEPARTMENT_DESC) VALUES 
      ('#{@department.DEPARTMENT_NAME}','#{@department.DEPARTMENT_DESC}');"
      connection.execute(query)
      redirect_to action: "index"
  end

  def index
      @student = current_user
      query = "SELECT * FROM departments"
      @departments= ActiveRecord::Base.connection.query(query)
      
  end

  def destroy
    query = "DELETE from departments where department_id = '#{@department.department_id}';"
    ActiveRecord::Base.connection.query(query)
    redirect_to action: "index"
  end

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
     params.require(:department).permit(:DEPARTMENT_NAME,:DEPARTMENT_DESC)
  end
end
