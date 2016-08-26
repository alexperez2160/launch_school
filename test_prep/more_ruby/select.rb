def select(arr)
  counter = 0 
  new_arr = []
  if block_given?
    while counter < arr.size do  
      if yield(arr[counter]) == true 
        new_arr << arr[counter]
      end 
     counter += 1 
    end 
  end
  new_arr
end 


p select([1,3,5,6,8,9]) {|num| num.odd?}
   
    