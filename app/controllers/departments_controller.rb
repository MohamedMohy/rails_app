class DepartmentsController < ApplicationController

    before_action :set_department, only: [:show, :edit, :update, :destroy]
  def new
      @department =Department.new
  end
  def create
    connection = ActiveRecord::Base.connection
      @department =Department.new(department_params)
      query = "INSERT INTO departments 
      (department_id,department_name,department_desc) VALUES 
      ('#{@department.department_id}','#{@department.department_name}','#{@department.department_desc}');"
      connection.execute(query)
      redirect_to action: "index"
  end

  def index
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
     params.require(:department).permit(:department_id,:department_name,:department_desc)
  end
end
