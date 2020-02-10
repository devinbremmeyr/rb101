# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code and what does it output?

any_return_value = [1, 2, 3].any? do | num |
  puts num
  num.odd?
end

# The blocks return value is either true or false depending on
# if the current element is odd or even.

# The return value of any? is true beacause the block returns true at least once.
# The block outputs each element of the array to the console out 
# 1
# 2
# 3

# Correction: I was wrong. Enumerable#any? short circuits once it gets one true value.
# Therefore only the first element is output to the console out.
# 1