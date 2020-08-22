nums = [5, 6, 7, 8]
factorials = []
for num in nums
  sum = 0
  while num > 0
    sum += num
    num -= 1
  end
  factorials.append(sum)
end
puts factorials
return factorials