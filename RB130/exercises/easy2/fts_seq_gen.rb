def step(s, e, v)
  i = s
  while i <= e
    yield(i)
    i += v
  end
  nil
end


step(1, 10, 3) { |value| puts "value = #{value}" }