def missing(arr)
  missing_nums = []
  range = (arr[0]..arr.last).to_a
  range.each do |num|
    missing_nums << num if !arr.include?(num)
  end

  missing_nums
end




p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []