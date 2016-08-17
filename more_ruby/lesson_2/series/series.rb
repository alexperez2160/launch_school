class Series
  attr_accessor :str
  
  def initialize(str)
    @str= str
  end 
  
  def slices(n)
    if n > str.size
      raise ArgumentError
    else
      i = 0 
      arr = []
      loop do 
        break if i + n > str.size 
        arr << str[i, n].split(//)
        i += 1
      end 
    end
  arr.map do |group|
    group.map{|digit| digit.to_i}
  end 
  end 
end 

example = Series.new('0123')

p example.slices(2)