# without using Array#to_h write some code that will return a hash where
# the key is the first item in each sub array and the value is the second item.
require 'pp'

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh = arr.each_with_object({}) do |sub_arr, hsh|
  hsh[sub_arr[0]] = sub_arr[1]
end

pp hsh

pp arr