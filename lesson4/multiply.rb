# define a method that will multiply every number in an array by a given number

def multiply(number_array, multiplier)
  multiple_array = []
  counter = 0

  loop do
    break if counter >= number_array.size
    multiple_array << number_array[counter] * multiplier
    counter += 1
  end
  multiple_array
end

numbers = [2,27,4,12]

p multiply(numbers, 7)