# use map to return a new array identical in strucutre to the original but
# where the value of each integer is incremented by 1
# do not modify the original array

arr1 = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr1.map do |hsh|
  hsh1 = hsh.clon
  hsh1.each do |key, _|
    hsh1[key] += 1
  end
end

p arr1
p arr2