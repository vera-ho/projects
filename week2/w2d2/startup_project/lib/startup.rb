require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(company_name, funding, salaries)
        @name = company_name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(str)
        @salaries.has_key?(str)
    end

    def >(startup)
        self.funding > startup.funding
    end
    
    def hire(employee_name, title_name)
        unless @salaries.has_key?(title_name)
           raise ArgumentError.new "Job title is invalid."
        end

        @employees << Employee.new(employee_name, title_name)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        title = employee.title
        unless @funding > @salaries[title]
            raise StandardError.new "There is not enough funding."
        end

        employee.pay(@salaries[title])
        @funding -= @salaries[title]
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0.0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, pay|
            if !@salaries.has_key?(title)
                @salaries[title] = pay
            end
        end

        @employees = [@employees, startup.employees].flatten
        startup.close
    end
end
