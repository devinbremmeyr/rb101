# What is the return value of the following statement? Why?

return_value = ['ant', 'bear', 'caterpillar'].pop.size
p return_value
# => 11
# Methods are being chained here so size is being called on the return value of pop.
# Array#pop returns the last element of the array and destructivley removes it from the array.
# Therefore size returns 11 the size of the string 'caterpillar'.