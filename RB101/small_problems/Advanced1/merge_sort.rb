def merge_sorted_arrays(array1, array2)
  result = []
  idx2 = 0

  array1.each do |element|
    while idx2 < array2.length && array2[idx2] <= element
      result << array2[idx2]
      idx2 += 1
    end
    result << element
  end

  result.concat(array2[idx2..-1])
end

def merge_sort(array)
  if array.length <= 1
    return array
  end
  left_array = merge_sort(array[0...array.length/2])
  right_array = merge_sort(array[(array.length/2)..-1])

  merge_sorted_arrays(left_array, right_array)
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]