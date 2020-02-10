# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
p hash.shift
p hash

# We can check the documentation for Hash#shift.
# This will tell us one key value pair will be removed from hash and returned by shift
# as a two element array.
# We can also try to run code to print the values involved.