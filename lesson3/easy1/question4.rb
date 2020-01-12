# question4.rb

numbers = (1..5).to_a

numbers.delete_at(1)
# deletes the number 2 #=>[1,3,4,5]

numbers = (1..5).to_a
numbers.delete(1)
# deletes all occurances of 1 in the array #=> [2,3,4,5]