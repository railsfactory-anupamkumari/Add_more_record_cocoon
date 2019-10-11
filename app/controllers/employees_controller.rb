class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @employee.timesheets.build
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to timesheets_path, notice: 'Timesheets created successfully for the employee.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.fetch(:employee,{}).permit(:id, :name, :role, project_ids:[],
        timesheets_attributes: [:id, :comments, :hours, :employee_id, :project_id, :_destroy])
    end
end
