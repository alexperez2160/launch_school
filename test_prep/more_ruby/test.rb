class Employee
  attr_accessor :name, :serial, :type, :vacation, :desk, :delegator
  def initialize(name, serial)
    @name = name 
    @serial = serial 
  end 
end 

module Prefixable 
  def to_s
    saved_class = self.class
    
    case saved_class 
      when Exec.class
        puts "Exe"+ " " + self.name
      when Manager.class
        puts "Mgr" + " " + self.name 
      else 
        puts self.name
    end 
  end 
end 

class Exec < Employee
  include Prefixable 
  
  def set_info
    self.type = "full-time"
    self.vacation =20
    self.desk = "corner office"
    self.delegator = true 
  end 
end 

class Manager < Employee 
  include Prefixable 
  
  def set_info 
    self.type = "full-time"
    self.vacation = 14
    self.desk = "private office"
    self.delegator = true 
  end 
end 

class Regular < Employee 
  def set_info
    self.type = "fulltime"
    self.vacation = 10
    self.desk = "desk farm"
  end 
end 

class PartTime< Employee
  def set_info
    self.type = "part-time"
  end 
end 

jamie = Exec.new("Jamie", "02345")

jamie.set_info

puts jamie

p jamie.desk