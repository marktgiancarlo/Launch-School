
require_relative 'swap_letters.rb'

class SwapLettersTest < Minitest::Test
  def setup
    @file = File.new('swap_letters.txt', 'r')
    @data = @file.read
    @txt = Text.new(@data)
  end
  
  def test_swap
    e_count_before = @data.count('e')
    a_count_before = @data.count('a')
    swapped = @txt.swap('a', 'e')
    e_count_after = swapped.count('e')
    a_count_after = swapped.count('a')
    assert_equal(e_count_before + a_count_before, e_count_after + a_count_after)
  end

  def test_word_count
    assert_equal(@data.split.count, @txt.word_count)
  end

  def teardown
    @file.close
  end
end