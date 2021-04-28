factorial = Enumerator.new do |y|
  a, b = 1, 1
  loop do
    y << (1..a).reduce(:*)
    a, b = b, b + 1
  end
end

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end