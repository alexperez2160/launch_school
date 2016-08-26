def compute(num)
  return "Cannot compute" unless block_given?
  yield(num)
end 

p compute(8) { |num| num + 3 }