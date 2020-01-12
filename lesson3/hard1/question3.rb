# question3.rb

# What will be printed by each of these code groups

def mess_with_vars_A(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars_A(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

##################################################

def mess_with_vars_B(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars_B(one, two, three)

puts "one is: #{one}"     # => "one"
puts "two is: #{two}"     # => "two"
puts "three is: #{three}" # => "three"

#################################################

def mess_with_vars_C(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars_C(one, two, three)

puts "one is: #{one}"     # => "two"
puts "two is: #{two}"     # => "three"
puts "three is: #{three}" # => "one"