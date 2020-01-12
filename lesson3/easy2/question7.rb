# question7.rb

# In the previous practice problem we added Dino to our array like this
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#flintstones << "Dino"

# We could have used either Array#concat ro Array#push to add Dino to the family.

# How can we add multiple items to our array? (Dino and Hoppy)
p flintstones.push("Dino", "Hoppy")
p flintstones.concat(%w(Dino Hoppy))
p flintsones = flintstones + ["Dino", "Hoppy"]