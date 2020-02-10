# What is the return value of the following code? Why?

return_value = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p return_value

# => [1, nil, nil]
# 2
# 3
# Array#map returns a new array containg the return value of the given block for each
# corresponding element of the original array.
# This block returns 1, then nil for numbers greater than 1.