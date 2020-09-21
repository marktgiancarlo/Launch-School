def integer?(input)
  /^-?\d+$/.match(input)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def number?(input)
  integer?(input) || float?(input)
end



loan_amount = nil
loop do
  print "Enter the loan amount: $"
  loan_amount = gets.chomp
  break if number?(loan_amount)
  puts "Invalid input. Please enter a number."
end
loan_amount = loan_amount.to_f

apr = nil
loop do
  print "Enter the Annual Percentage Rate (APR): "
  apr = gets.chomp
  break if number?(apr)
  puts "Invalid input. Please enter a number."
end
apr = apr.to_f / 100

loan_duration = nil
loop do
  print "Enter the duration of the loan in years: "
  loan_duration = gets.chomp
  break if number?(loan_duration)
  puts "Invalid input. Please enter a number."
end
loan_duration = loan_duration.to_f

monthly_interest_rate = apr / 12
loan_duration_months = loan_duration * 12
monthly_pmt = loan_amount * (monthly_interest_rate / (1 - 
              (1 + monthly_interest_rate)**(-loan_duration_months)))

puts (monthly_interest_rate * 100).to_s + "%"
puts loan_duration_months.to_s + " months"
puts "$" + monthly_pmt.round(2).to_s




#choice = nil
#loop do
#  puts '>> Do you want me to print something? (y/n)'
#  choice = gets.chomp.downcase
#  break if %w(y n).include?(choice)
#  puts '>> Invalid input! Please enter y or n'
#end
#puts 'something' if choice == 'y'