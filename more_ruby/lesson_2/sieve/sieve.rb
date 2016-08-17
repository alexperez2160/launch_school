require 'prime'

class Sieve
  attr_accessor :range, :limit
  
  def initialize(start = 2, limit)
    @range = (2..limit).to_a 
  end 
  
  def primes 
    i = 2 
    loop do 
      break if i == range.max 
      range.each do |num| 
        if num % i == 0 && num != i 
          range.delete(num)
        end
      end
      i += 1 
    end 
    range
  end 
end 

example = Sieve.new(1000)

p example.primes
