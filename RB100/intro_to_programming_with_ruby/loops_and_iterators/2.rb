def not_mimicking_you()
  str = gets.chomp
  while str != "STOP"
    puts str
    str = gets.chomp
  end
end

not_mimicking_you()