# titleize

def titleize(title_string)
  title_array = title_string.split(' ')
  title_array.map! { |word| word.capitalize }
  title_array.join(' ')
end

words = "the flintstones rock"

puts titleize(words) # => "The Flintstones Rock"