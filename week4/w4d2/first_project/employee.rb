require 'byebug'

class Employee
    attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    # @bonus = 
  end

  def bonus(multiplier)
    @bonus = salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :employees
  def initialize(name, title, salary, boss)
    @employees = []
    super
  end

  def add_employee(employee)
    @employees << employee
  end

  def bonus(multiplier)
    # debugger
    salary_sum = 0
    return 0 if @employees.nil? || @employees.empty?
    @employees.each do |employee| 
      salary_sum += employee.bonus(1) + employee.salary
    end
    @bonus = multiplier * salary_sum
  end
end

ned = Manager.new("Ned", "Founder", 1000000,nil)
darren = Manager.new("Darren", "TA manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")
darren.add_employee(david)
darren.add_employee(shawna)
ned.add_employee(darren)
p ned
#p shawna.bonus(2)
p ned.bonus(5)
p ned.employees
