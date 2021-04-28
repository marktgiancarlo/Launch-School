def each_with_index(arr)
  iter = 0
  while iter < arr.size
    yield(arr[iter], iter)
    iter += 1
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]