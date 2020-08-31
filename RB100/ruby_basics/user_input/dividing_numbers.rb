def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num1 = nil
num2 = nil
puts "Enter a number:"
loop do
  num1 = gets.chomp
  break if valid_number?(num1)
  puts "Enter a valid number:"
end
puts "Enter a non zero number:"
loop do
  num2 = gets.chomp
  break if valid_number?(num2) && num2.to_i != 0
  puts "Enter a valid non zero number."
end
puts "#{num1} / #{num2} is #{num1.to_i / num2.to_f}"


#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'