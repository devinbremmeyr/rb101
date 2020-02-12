# return a new array containing the same sub-arrays as the original
# but ordered logically by only taking into consideration the odd numbers they contain

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

odd_sort_arr = arr.sort_by do |arr|
  arr.select { |num| num % 2 == 1 }
end

p odd_sort_arr