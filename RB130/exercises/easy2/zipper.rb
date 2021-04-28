def zip(a1, a2)
  new_a = []
  a1.each_with_index do |ele, i|
    new_a << [ele, a2[i]]
  end
  new_a
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]