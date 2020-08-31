input = nil
loop do
  puts "How many lines? Enter a number >= 3."
  input = gets.chomp.to_i
  break if input >= 3
  puts "Must enter a number >= 3."
end
input.times {puts "Launch School is the best!"}

#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'