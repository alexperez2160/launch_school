class Octal
  attr_accessor :str 
  
  def initialize(str)
    @str = str
  end 
  
  def to_decimal 
    arr = str.split('').reverse.map(&:to_i)
    arr.map.with_index{|num, index| num*(8**index)}.reduce(:+)
  end 
end 

example = Octal.new('32')

p example.to_decimal