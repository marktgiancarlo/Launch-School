# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
# this proc can be stored in a variable and the action within accessed by
# calling the call method. The proc will execute with or without an argument.

puts '========================'
# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# can define a lambda 2 ways. lambda {|arg| ...}, -> (arg) {...}
# a lambda is a Proc object, is not itself a class
# enforces argument count

puts '========================'
# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')
# must pass in block if method has yield. must pass arg to block thru yield.

puts '========================'
# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
# does not enforce arg count.
# if yield passes an arg, block can't exclude param, but can ignore them (_).

