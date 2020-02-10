# What is the return value of the select method below? why?

return_value = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p return_value

# => [1, 2, 3]
# The return value of the block is truthy since it is always 'hi'.
# Therefore select will return a new array with each value from the original array.