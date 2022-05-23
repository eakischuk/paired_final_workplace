class Department
  attr_reader :name, :employees, :expenses

  def initialize(name)
    @name = name
    @employees = []
    @expenses = 0
  end

  def hire(employee)
    @employees << employee
  end

  def expense(cost)
    @expenses += cost
  end

  def salary(given_employee)
    @employees.find do |employee|
      employee == given_employee
    end.salary
  end

  def employee_salaries
    salaries ={}
    employees.each do |employee|
      salaries[employee] = salary(employee)
    end
    salaries
  end
end
