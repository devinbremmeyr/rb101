# pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ''
youngest_age = 10_000

ages.each do | name, age |
  if age < youngest_age
    youngest = name
    youngest_age = ag
  end
end

puts "The youngest munster is #{youngest} at #{youngest_age} years old!"