require './lib/employee'
require 'pry'

RSpec.describe Employee do
  before(:each) do
    @bobbi = Employee.new({name: "Bobbi Jaeger",
                           age: "30",
                           salary: "100000"})
  end

  it 'exists and has attributes' do
    expect(@bobbi).to be_an(Employee)
    expect(@bobbi.name).to eq("Bobbi Jaeger")
    expect(@bobbi.age).to eq(30)
    expect(@bobbi.salary).to eq(100000)
  end
end
