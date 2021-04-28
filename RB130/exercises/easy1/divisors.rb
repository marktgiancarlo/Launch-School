def divisors(int)
  div = []
  for num in (1..(int / 2)).to_a
    div << num if int % num == 0
  end

  div << int
end








p divisors(1) == [1]
p divisors(7)  == [1, 7]
p divisors(12)  == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute