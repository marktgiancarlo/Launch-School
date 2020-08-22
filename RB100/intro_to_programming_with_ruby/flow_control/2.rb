def cap_length_ten(str)
  if str.length <= 10
    str
  else
    str.upcase
  end
end

p cap_length_ten("ten")
p cap_length_ten("i love you oodles")