array = [1, 2, 3, 4, 5]

def reduce(arr, default=0)
  counter = 0
  sum = default
  
  while counter < arr.size 
    sum = yield(sum, arr[counter])
    counter += 1
  end 

  sum
end 

p reduce(array) { |acc, num| acc + num }

p reduce(array, 10) { |acc, num| acc + num }
p reduce(array) { |acc, num| acc - num }