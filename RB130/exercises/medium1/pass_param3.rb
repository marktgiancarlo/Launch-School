items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*args,last|
  puts args.join(', ')
  puts last
end

gather(items) do |first,*args,last|
  puts first
  puts args.join(', ')
  puts last
end

gather(items) do |first,*args|
  puts first
  puts args.join(', ')
end

gather(items) do |first,second,third,fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end