# use the each method to output all vowels from the strings in hsh

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |value|
  value.each do | word |
    puts word.gsub(/[^aeiou]/, '')
  end
end