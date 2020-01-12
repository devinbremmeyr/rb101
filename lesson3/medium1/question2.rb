# question2.rb

# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?
# Answer: Type Error you need to convert the number to a string to concatinate it.
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"