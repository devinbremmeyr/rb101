# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"
letter_count_hash = {}
statement.chars.each do | char |
  if letter_count_hash.key?(char)
    letter_count_hash[char] += 1
  else
    letter_count_hash[char] = 1
  end
end

p letter_count_hash