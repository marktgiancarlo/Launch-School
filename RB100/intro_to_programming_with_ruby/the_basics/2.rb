num = 1234
ones = num % 10
tens = num / 10 % 10
hundreds = num / 100 % 10
thousands = num / 1000 % 10
puts [ones, tens, hundreds, thousands]