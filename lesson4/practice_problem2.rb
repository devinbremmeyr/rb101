# How does count treat the block's return value? How can we find out?

answer = ['ant', 'bat', 'caterpillar'].count do | str |
  str.length < 4
end

p answer

# We can find out by reading the documentation.
# Count checks the truthiness of the blocks return value.