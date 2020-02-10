produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_hash)
  fruit_hash = {}
  # iterate through keys in produce_hash
  counter = 0
  keys = produce_hash.keys
  loop do
  break if counter == produce_hash.size
  # check if value matching key is 'Fruit' if so   
    current_key = keys[counter].clone
    current_value = produce_hash[current_key].clone
    if current_value == 'Fruit'
      fruit_hash[current_key] = current_value
    end
    counter += 1    
  end
   
  # return a new hash with selected key-value pairs
  fruit_hash
end

fruit = select_fruit(produce)
fruit['apple'] << 's'
p fruit
p produce