# What is the return value of map in the following code? Why?

return_value = { a: 'ant', b: 'bear' }.map do |_key, value|
  if value.size > 3
    value
  end
end

p return_value
# => [nil, 'bear']
# Enumerable#map returns an array with containg each return value from the given block.
# In this case the if statment in the block returns nil for the value 'ant',
# for 'bear' the value 'bear' is returned.