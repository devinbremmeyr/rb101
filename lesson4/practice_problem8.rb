# How does take work? Is it destructive? How can we find out?

arr = (1..5).to_a
p arr.take(2)
p arr
# The docs tell us Array#take returns the first n elements of the origional array in a new array.
# Where n is the method argument given to take.
# The docs do not indicate that Array#take as destructive. 
# We can verfiy this by checking the value of arr after calling take on it.