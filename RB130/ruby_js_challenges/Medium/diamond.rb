class Diamond
  def self.make_diamond(letter)
    return "A\n" if letter == 'A'
    letters = ('A'..letter).to_a
    @line_width = letters.size * 2 - 1
    lines = []
    letters.each_with_index do |char, i|
      lines << create_line(char, i)
    end
    lines << lines[0..-2].reverse
    string = lines.join("\n") + "\n"
  end

  private

  def self.create_line(letter, index)
    if letter == 'A'
      letter.center(@line_width)
    else
      "#{letter}#{' ' * ((2 * (index - 1)) + 1)}#{letter}".center(@line_width)
    end
  end
end


puts Diamond.make_diamond('E')



# return 'A\n' if letter is 'A'
# create array with all the ascending letters to be used


# create ascending diamond
  # center each line with line width
    # line width = letters.size * 2 - 1
  # lines with 'A' only contain one letter
  # all other lines contain two letters with a space between
    # space = 1 at 'B', +2 for each subsequent letter



# append ascending diamond in reverse order (minus letter) to diamond


# i spaces
# 0 0   -
# 1 1   2*(i-1) + 1
# 2 3   
# 3 5   
# 4 7
# 5 9