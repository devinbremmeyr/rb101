# Implement a method that takes two arguments
# 1. a sentence string consisting of one or more words
# 2. a value which represents a particular case type from either snake case, camel case, or upper snake case.
# The method should return the given string transformed into the appropriate case.

def change_case(sentence, new_case)
  case new_case
  when :snake
    snake(sentence)
  when :camel
    camel(sentence)
  when :upper_snake
    upper_snake(sentence)
  else
    puts 'Invalid case type'
  end
end


# Example:

sentence = 'The sky was blue'
change_case(sentence, :snake) #=> 'the_sky_was_blue'