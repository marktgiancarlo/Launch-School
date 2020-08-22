nums = [1,2,3,4,5,6,7,8,9,10]
odds = nums.select {|x| x % 2 == 1}
p odds