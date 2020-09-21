def star(n)
  print_contracting_stars(n)
  print_middle_row(n)
  print_expanding_stars(n)
end

def print_contracting_stars(n)
  row_string = String.new
  edge_space = 0
  star_spaces = (n - 3) / 2
  loop do
    row_string << (' ' * edge_space) + '*'
    2.times { |x| row_string << ((' ' * star_spaces) + '*') }
    puts row_string
    break if star_spaces == 0
    edge_space += 1
    star_spaces -= 1
    row_string = String.new
  end
end

def print_middle_row(n)
  puts '*' * n
end

def print_expanding_stars(n)
  row_string = String.new
  edge_space = (n - 3) / 2
  star_spaces = 0
  loop do
    row_string << (' ' * edge_space) + '*'
    2.times { |x| row_string << ((' ' * star_spaces) + '*') }
    puts row_string
    break if edge_space == 0
    edge_space -= 1
    star_spaces += 1
    row_string = String.new
  end
end

star(55)