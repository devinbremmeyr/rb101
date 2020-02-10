# In the array:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Find the index of the first name that starts with "Be"

i = flintstones.find_index {|name| name[0..1] == 'Be'}

puts i