# Given the array below

flintstones = %w(Fred Barney Wilma Betty Pebbles BamBam)

# Turn this array into a hash where the names are the keys and the values are the array indecies.
i = 0
flint_hash = flintstones.each_with_object({}) do | name, hsh |
  hsh[name] = i
  i += 1
end

p flint_hash
