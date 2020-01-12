# question6.rb

# How could the unnecsessary duplication in this method be removed?

def color_valid(color)
  ["blue", "green"].include?(color)
end

def color_valid(color)
  color == "blue" || color == "green"
end