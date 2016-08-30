class Anagram 
  attr_accessor :word
  
  def initialize(word)
    @word = word
  end 
  
  def match(arr)
    original_word_arr = word.downcase.split("")
    result_array = []
    # prelim checks to remove same words or words that aren't the same size 
    arr.delete_if{|new_word| new_word.size != word.size || new_word.downcase == word}
    
    # loop for the letter check 
    i = 0 
    i2 = 0
    loop do  
      break if i2 == arr.size
        if arr[i2].downcase.include?(original_word_arr[i])
          i += 1
          if i == original_word_arr.size
            result_array << arr[i2]
            i2 += 1 
            i = 0 
          end 
        else 
          i2 += 1
          i = 0
        end
    end
  end 
end 

test = Anagram.new('galea')

p test.match(['eagle'])

