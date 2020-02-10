# what is the return value of each_with_object in the following code? Why?

return_value = %w(ant bear cat).each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

p return_value
# => {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
# The method argument (object) passed to each_with_object is an empty hash represented
# by the block argument hash. Each string from the original array will be passed into
# the empty hash paried with the key represented by the first characer of that string.