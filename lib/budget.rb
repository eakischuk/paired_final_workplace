class Budget
  attr_reader :year, :departments
  def initialize(year)
    @year = year
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def low_expense_departments
    @departments.find_all do |department|
      department.expenses < 500
    end
  end

  def salaries
    department_salaries = {}
    @departments.each do |department|
      department_salaries[department] = department.employee_salaries
    end
    department_salaries
  end
end
