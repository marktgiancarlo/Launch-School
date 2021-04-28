def select(arr)
  counter = 0
  new_arr = []

  while counter < arr.length
    bool = yield(arr[counter])
    new_arr << arr[counter] if bool
    counter += 1
  end

  new_arr
end

array = [1, 2, 3, 4, 5]

a = array.select { |num| num.odd? }       # => [1, 3, 5]
b = array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
c = array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

d = select(array) { |num| num.odd? }      # => [1, 3, 5]
e = select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
f = select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true

puts a == d
puts b == e
puts c == f
