puts "Please enter a number between 0 and 100."
num = gets.chomp.to_i
response = case
  when num < 0
    "That is a negative number."
  when num >= 0 && num <= 50
    "That number is between 0 and 50."
  when num >= 51 && num <= 100
    "That number is between 51 and 100."
  else
    "That number is above 100."
  end
puts response
