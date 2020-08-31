input = nil
loop do
  loop do
    puts "How many lines? Enter a number >= 3."
    input = gets.chomp
    break if input.to_i >= 3 || input.upcase == "Q"
    puts "Must enter a number >= 3."
  end
  break if input.upcase == "Q"
  input.to_i.times {puts "Launch School is the best!"}
end

#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'