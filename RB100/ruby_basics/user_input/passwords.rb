PASSWORD = "1020"

input = nil
loop do
  puts "Please enter your password:"
  input = gets.chomp
  break if input == PASSWORD
  puts "Invalid password!"
end
puts "Welcome!"





#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'