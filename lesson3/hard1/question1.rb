# question1.rb

# What do you expect to happen when the greeting variable is referenced is the 
# last line of the code below?

if false
  greeting = "hello world"
end

greeting #=> nil: noramally referencing an uninitialized variable would raise
          # a name error. However ruby automatically initializes a variable in an 
          # if block to nil, even if that code is not reached.