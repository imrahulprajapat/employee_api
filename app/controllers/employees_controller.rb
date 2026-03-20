class EmployeesController < ApplicationController
  def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: employee.errors, status: :unprocessable_entity
    end
  end

  def salary
    employee = Employee.find(params[:id])
    result = SalaryCalculator.calculate(employee)

    render json: result, status: :ok
  end

  def country_metrics
    employees = Employee.where(country: params[:country])

    render json: {
      min: employees.minimum(:salary)&.to_f,
      max: employees.maximum(:salary)&.to_f,
      avg: employees.average(:salary)&.to_f
    }, status: :ok
  end

  def job_metrics
    employees = Employee.where(job_title: params[:job_title])

    render json: {
      avg: employees.average(:salary)&.to_f
    }, status: :ok
  end

  private

  def employee_params
    params.require(:employee).permit(:full_name, :job_title, :country, :salary)
  end
end
