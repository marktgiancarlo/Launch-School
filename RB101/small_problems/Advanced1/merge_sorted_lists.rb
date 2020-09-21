require 'pry'

def merge(arr1, arr2)
  result = []
  if arr1.empty?
    return arr2
  elsif arr2.empty?
    return arr1
  elsif arr1.empty? and arr2.empty?
    return result
  end
  idx1 = 0
  idx2 = 0
  loop do
    if arr1[idx1] <= arr2[idx2]
      result << arr1[idx1]
      idx1 += 1
    else
      result << arr2[idx2]
      idx2 += 1
    end
    if idx1 == arr1.length
      result.concat(arr2[idx2..])
      break
    end
    if idx2 == arr2.length
      result.concat(arr1[idx1..])
      break
    end
  end
  result
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]