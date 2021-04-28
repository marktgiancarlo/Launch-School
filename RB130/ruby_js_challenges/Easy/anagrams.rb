class Anagram
  def initialize(str)
    @str = str
    @str_char_count = char_count(str.downcase)
  end

  def match(arr)
    arr.each.with_object([]) do |word, obj|
      obj << word if is_anagram?(word.downcase) && !same_word?(word)
    end
  end

  private

  def is_anagram?(word)
    char_count(word) == @str_char_count
  end

  def char_count(word)
    count = {}
    word.split('').each do |letter|
      if count.has_key?(letter)
        count[letter] += 1
      else
        count[letter] = 1
      end
    end
    count
  end

  def same_word?(word)
    word.downcase == @str.downcase
  end
end