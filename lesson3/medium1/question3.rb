# question3.rb

# Alan wrote the following method, which was intended to show all of the factors
# of the input number:
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number,
# and asked Alan to change the loop. How can you make this work without using 
# begin/end/until ? Note that we're not looking to find the factors for 0 or 
# negative numbers, but we just want to handle it gracefully instead of raising
# an exception or going into an infinite loop.

def find_factors(number)
  #return [] if number == 0
  #number = number.abs
  divisor = number
  factors = []
  while divisor > 0 
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# Answer: This conditional determines if divisor is a factor of number.

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method 
# (the factors before the method's end)?
# Answer: This causes the method to return the array factors.

p find_factors(-20)
p find_factors(0)
