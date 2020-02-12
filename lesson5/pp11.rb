# use select or reject methods to return a new array identical in strucutre to the original
# but containing only the integers that are multiples of 3

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr1 = arr.map do |sub_arr|
  sub_arr.reject { |n| n % 3 != 0 }
end

p arr1
p arr