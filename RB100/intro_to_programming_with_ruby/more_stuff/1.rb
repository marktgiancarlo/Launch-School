strings = ['laboratory', 'experiment', 'Pans Labyrinth', 'elaborate', 'polar bear']
strings.each { |string|
  if string =~ /lab/
    puts string
  end
}