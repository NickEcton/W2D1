class Employee
  attr_reader :salary 
  def initialize(employee_name, title, salary, boss)
    @employee_name = employee_name
    @title = title
    @salary = salary
    @boss = boss
  end 
  
  def bonus(multiplier)
    @salary * multiplier
  end 
end 


class Manager < Employee
  attr_reader :subordinates
  def initialize(employee_name, title, salary, boss, subordinates)
    super(employee_name, title, salary, boss)
    @subordinates = subordinates
  end 

  def bonus(multiplier)
    real_salary * multiplier
  end 
  
  def real_salary
    salary = 0
    @subordinates.each do |emp|
      if emp.is_a?(Manager)
        salary += emp.salary + emp.real_salary
      else 
        salary += emp.salary 
      end 
    end 
    salary 
  end 
end
