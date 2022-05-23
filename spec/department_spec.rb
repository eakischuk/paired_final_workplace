require './lib/department'
require './lib/employee'
require 'pry'

RSpec.describe Department do
  before(:each) do
    @customer_service = Department.new("Customer Service")
    @bobbi = Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})
    @aaron = Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})
  end

  it 'exists and has attributes' do
    expect(@customer_service).to be_a(Department)
    expect(@customer_service.name).to eq("Customer Service")
    expect(@customer_service.employees).to eq([])
  end

  it 'can hire employees' do
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)

    expect(@customer_service.employees).to eq([@bobbi, @aaron])
  end

  it 'expenses' do
    expect(@customer_service.expenses).to eq(0)
    @customer_service.expense(100)
    @customer_service.expense(25)
    expect(@customer_service.expenses).to eq(125)
  end

  it 'has given employee salary' do
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    expect(@customer_service.salary(@aaron)).to eq(90000)
  end

  it 'has employee salaries' do
    @customer_service.hire(@bobbi)
    @customer_service.hire(@aaron)
    result = {@bobbi => 100000,
              @aaron => 90000}
    expect(@customer_service.employee_salaries).to eq(result)
  end
end
