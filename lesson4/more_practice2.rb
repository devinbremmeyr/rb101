# Add up all the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_of_ages = ages.values.inject(:+)
puts sum_of_ages

total_age = 0
ages.each do | _name, age |
  total_age += age
end
puts total_age