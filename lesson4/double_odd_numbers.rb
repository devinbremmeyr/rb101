# define a method that takes an array and doubles numbers in the array with odd indecies

def double_odd_numbers(num_array)
  counter = 0
  doubled_numbers = []
  loop do
    break if counter >= num_array.size
    current_number = num_array[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number
    counter += 1
  end
  doubled_numbers
end

p double_odd_numbers([1,2,3,4,5,6,7,8])