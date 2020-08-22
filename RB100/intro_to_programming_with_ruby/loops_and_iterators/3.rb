def recursive_countdown(num)
  puts num
  if num > 0
    recursive_countdown(num - 1)
  end
end

recursive_countdown(544751)