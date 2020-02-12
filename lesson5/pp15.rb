# return an array which contains only the hashes where all the integers are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

only_evens_hashes = arr.select do |hsh|
  hsh.all? do |_, sub_arr|
    sub_arr.all? { |n| n.even? }
  end
end

p only_evens_hashes