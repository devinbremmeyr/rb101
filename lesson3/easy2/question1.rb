# question1.rb

# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.

puts ages.key?("Spot")

puts ages.has_key?("Spot")

puts ages.include?("Spot")

puts ages.member?("Spot")