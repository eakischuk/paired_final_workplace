require './lib/budget'
require './lib/department'
require './lib/employee'
require 'pry'

RSpec.describe Budget do
  before(:each) do
    @budget = Budget.new("2021")
    @customer_service = Department.new("Customer Service")
    @sales = Department.new("Sales")
    @bobbi = Employee.new({name: "Bobbi Jaeger",
                           age: "30",
                           salary: "100000"})
    @mike = Employee.new({name: "Mike Dao",
                          age: "25",
                          salary: "90000"})
    @aaron = Employee.new({name: "Aaron Tanaka",
                           age: "25",
                           salary: "90000"})
  end

  it 'exists and has attributes' do
    expect(@budget).to be_a(Budget)
    expect(@budget.year).to eq("2021")
    expect(@budget.departments).to eq([])
  end

  it 'adds departments' do
    @budget.add_department(@customer_service)
    expect(@budget.departments).to eq([@customer_service])
    @budget.add_department(@sales)
    expect(@budget.departments).to eq([@customer_service, @sales])
  end

  it 'lists departments with less than 500 expenses' do
    @budget.add_department(@customer_service)
    @budget.add_department(@sales)
    @sales.expense(1000)
    @customer_service.expense(200)
    expect(@budget.low_expense_departments).to eq([@customer_service])
  end

  it 'lists employee salaries by department' do
    @customer_service.hire(@bobbi)
    @sales.hire(@mike)
    @sales.hire(@aaron)
    @budget.add_department(@customer_service)
    @budget.add_department(@sales)
    result = {@customer_service => {@bobbi => 100000},
              @sales => {@mike => 90000,
                         @aaron => 90000}}
    expect(@budget.salaries).to eq(result)
  end
end
