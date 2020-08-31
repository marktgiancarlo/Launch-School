loop do
  puts "Do you want to print something? (y/n)"
  input = gets.chomp.upcase
  if input != "Y" && input != "N"
    puts "Try again."
    next
  end
  if input == "Y"
    puts "something"
  end
  break
end

#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'