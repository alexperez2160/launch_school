class Trinary
  attr_accessor :num 
  
  def initialize(num)
    @num = num 
  end 
  
  def to_decimal 
    arr = num.split("")
    if arr.select{|part| part =~/[a-zA-Z]/}.size > 0
      return 0 
    end 
    arr.map!(&:to_i) 
    arr.collect! {|num| num > 2? 0: num} 
    
    power = arr.length - 1 
    i = 0 
    new_arr = []
    while i < arr.length do 
      new_arr<< (arr[i]*(3**power))
      power -= 1
      i += 1
    end 
    new_arr.reduce(:+)
  end 
end 

p test = Trinary.new("100")

p test.to_decimal