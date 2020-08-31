require 'pry'

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

nums = []
loop do
  2.times do
    puts "Please enter a positive or negative number:"
    nums << gets.chomp
  end
  break if valid_number?(nums[0]) && valid_number?(nums[1])
  puts "Invalid input. Only non-zero integers are allowed."
  nums =[]
  binding.pry
end
puts "#{nums[0]} + #{nums[1]} = #{nums[0].to_i + nums[1].to_i}"

#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'