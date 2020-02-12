# What is the final value of each a and b?

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 #=> a += 2
arr[1][0] -= a #=> b[0] -= 4

# a is 4
# b is [1, 8] 
p a
p b

# CORRECTION
# numbers are immutable or frozen by default so arr[0] += 2 is assignment
# the value a is not effected