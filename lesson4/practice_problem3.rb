# What is the return value of reject in the following code? Why?

return_value = [1, 2, 3].reject do | num |
  puts num
end

p return_value

# => [1, 2, 3]
# The block returns nil because puts always returns nil.
# This means that reject returns a new array with each element of the original.