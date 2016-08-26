class RailFenceCipher
  attr_accessor :str, :num_of_rails
  
  def initialize(str, num_of_rails)
    @str = str
    @num_of_rails = num_of_rails
  end 
  
  def encode
    new_str = ""
    new_arr = []
    i=0
    while i < 25
      new_str << str[i]
      i += (num_of_rails-1)+num_of_rails
    end 
    new_str
  end 
end 

alley = RailFenceCipher.new("WECRLTEERDSOEEFEAOCAIVDEN", 3)
p alley.encode