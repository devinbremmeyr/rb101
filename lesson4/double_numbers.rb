# define a method that mutates an array by doubling all the numbers in it

def double_numbers!(num_arr)
  counter = 0
  loop do
    break if counter >= num_arr.size
    num_arr[counter] *= 2
    counter += 1
  end
end

num1 = [1, 2, 3, 4]
num2 = [20, 40, 70, 43]
num3 = []
p double_numbers!(num1)
p double_numbers!(num2)
p double_numbers!(num3)

p num1
p num2
p num3