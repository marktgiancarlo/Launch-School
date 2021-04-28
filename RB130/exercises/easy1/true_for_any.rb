# passes each element to a block
# if block returns true for any element, any? returns true, other wise false


def any?(arr)
  any = false
  for element in arr
    if block_given?
      any = true if yield(element)
    else
      any = true if element
    end
  end
  any
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false