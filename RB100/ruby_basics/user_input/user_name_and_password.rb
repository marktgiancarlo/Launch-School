CREDENTIALS = [["Mark", "0321"], ["Kait", "1020"]]

user = nil
pass= nil
loop do
  puts "Please enter your username:"
  user = gets.chomp
  puts "Please enter your password:"
  input = gets.chomp
  break if CREDENTIALS.include?([user, input])
  puts "Login failed!"
end
puts "Welcome!"