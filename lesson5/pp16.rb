# each UUID consists of 32 hexadecimal characters
# broken into 5 sections 8-4-4-4-12
# and is represented as a string
# Example: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# write a method that returns one UUID when called with no parameters

# generate a random hexdigit
# assemble 32 calls to rand_hex_digit into the correct format

HEX_DIGITS = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def rand_hex_digit(n=1)
  digits = ''
  while n > 0 
    digits += HEX_DIGITS.sample
    n -= 1
  end
  digits
end

def uuid    
  id = [8, 4, 4, 4, 12].map do |num_digits|
    rand_hex_digit(num_digits)
  end
  id.join('-')
end

puts uuid