# question2.rb

# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting # => "hi there"
puts greetings # => {:a=>"hi there"}

=begin
greetings[:a] was modified on line 7 because on line 6 we pointed informal greeting
directly to the object stored in the hash. To avoid this we could point to a 
copy of the object instead 
informal_greeting = greetings[:a].clone

or 

Instead of the << operator we could use string concatination, which will assign
informal greeting to a new variable.

informal_greeting = informal_greeting + ' there'
=end