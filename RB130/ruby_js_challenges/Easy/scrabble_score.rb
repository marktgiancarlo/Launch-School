class Scrabble
  LETTER_VALUES = {['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] => 1,
                   ['d', 'g',] => 2, ['b', 'c', 'm', 'p'] => 3, 
                   ['f', 'h', 'v', 'w', 'y'] => 4, ['k'] => 5,
                   ['j', 'x'] => 8, ['q', 'z'] => 10 }

  def initialize(word)
    @word = word
  end

  def self.score(word)
    sum = 0
    return sum if !word
    word.split('').each do |letter|
      if letter.match(/[a-zA-Z]/)
        LETTER_VALUES.each do |k, v|
          sum += v if k.include?(letter.downcase)
        end
      end
    end
    sum
  end

  def score(word=@word)
    Scrabble.score(word)
  end
end
