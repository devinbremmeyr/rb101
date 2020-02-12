# for each collection object change the value 3 to 4

arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

arr1[1][1] += 1
arr2[2] += 1
hsh1[:first][2].map!{ |n| n + 1 }
hsh2[['a']][:a].map!{ |n| n.class == Integer ? n + 1 : n }

p arr1
p arr2
p hsh1
p hsh2