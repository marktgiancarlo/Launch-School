class GuessingGame
  def play
    initialize_gameplay
    until game_over?
      display_guesses_remaining
      make_a_guess
      give_hint
    end
    display_result
  end

  private
  attr_accessor :guess, :guesses_remaining
  attr_reader :number

  def initialize_gameplay
    @guesses_remaining = 7
    @number = (1..100).to_a.sample
    @guess = nil
  end
  
  def game_over?
    guesses_remaining == 0 || guess == number
  end

  def is_integer?(str)
    /\A[-+]?\d+\z/ === str
  end

  def in_range?(str)
    num = str.to_i
    num > 0 && num < 101
  end

  def display_guesses_remaining
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def make_a_guess
    input = nil
    print "Enter a number between 1 and 100: "
    loop do
      input = gets.chomp
      break if is_integer?(input) && in_range?(input)

      print 'Invalid guess. Enter a number between 1 and 100: '
    end
    self.guess = input.to_i
    self.guesses_remaining -= 1
  end

  def give_hint
    if guess > number
      puts 'Your guess is too high.'
    elsif guess < number
      puts 'Your guess is too low.'
    else
      puts "That's the number!"
    end
    puts ''
  end

  def display_result
    puts guess == number ? 'You won!' : 'You have no more guesses. You lost!'
  end
end

game = GuessingGame.new.play