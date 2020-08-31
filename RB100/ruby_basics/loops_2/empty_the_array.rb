names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  name = names.pop
  if name == nil
    break
  else
    puts name
  end
end
