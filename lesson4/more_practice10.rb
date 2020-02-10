# Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group the family member is in
# (kid, adult, or senior)
# kid 0-17, adult 18-64, senior 65+
require 'pp'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do | _name, traits |
  case traits['age']
  when 0..17
    traits['age_group'] = 'kid'
  when 18..64
    traits['age_group'] = 'adult'
  else
    traits['age_group'] = 'senior'
  end
end
pp munsters