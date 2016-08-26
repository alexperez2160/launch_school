class Octal
  attr_accessor :str 
  
  def initialize(str)
    @str = str
  end 
  
  def to_decimal 
    arr = str.split('').reverse
    if arr.select{|part| part =~/[a-zA-Z]/}.size > 0
      return 0 
    else 
      arr.map.with_index{|num, index| num.to_i*(8**index)}.reduce(:+)
    end
  end 
end 

example = Octal.new('32')

p example.to_decimal