def reduce(arr, acc=arr[0])
  iter = 0
  reduc = acc
  iter += 1 if reduc == arr[0]

  while iter < arr.length
    reduc = yield(reduc, arr[iter])
  
    iter += 1
  end

  reduc
end

array = [1, 2, 3, 4, 5]

# puts reduce(array) { |acc, num| acc + num }                    # => 15
# puts reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']