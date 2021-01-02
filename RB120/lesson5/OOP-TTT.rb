require 'io/console'

# gameplay
class TTTGame
  def initialize
    display_intro_message
    @board = Grid.new
    @player_one = create_player
    @player_two = create_player
    @current_player = nil
  end

  def play
    loop do
      select_first_player
      @board.display_board
      loop do
        current_player_turn # extract to different player classes? problem with grid?
        break if end_of_game?

        next_player
        @board.clear_screen_display_board
      end
      display_result
      break unless play_again?

      @board.reset
    end
    display_outro_message
  end

  private

  def select_first_player
    players = [@player_one, @player_two].shuffle
    first = players.pop
    second = players[0]
    first.marker = 'X'
    second.marker = 'O'
    puts "By luck of the draw #{first.name} has been selected to go first."
    puts "#{first.name} will play #{first.marker}'s and #{second.name} will play #{second.marker}'s."
    @current_player = first
  end

  # awkward method
  def current_player_turn
    puts "It's #{@current_player.name}'s turn!"
    choice = @current_player.choose_placement(@board.open_spaces)
    @board.place_marker(choice, @current_player.marker)
    return unless @current_player.class == Computer

    puts "#{@current_player.name} chooses square ##{choice}."
    puts 'Press any key to continue.'
    STDIN.getch
  end

  def next_player
    @current_player = @player_two if @current_player == @player_one
    @current_player = @player_one if @current_player == @player_two
  end

  def end_of_game?
    @board.full? || @board.three_in_a_row?
  end

  def display_result
    if @board.full?
      puts "It's a tie!"
    else
      puts "#{@current_player.name} wins!"
    end
  end

  def display_intro_message
    puts 'Welcome to TicTacToe!'
    puts "Let's create our two players."
  end

  def display_outro_message
    puts 'Thanks for playing! Goodbye.'
  end

  def create_player
    answer = nil
    loop do
      puts 'Create a new player:'
      puts 'Is this player a (a) human, or (b) computer?'
      answer = gets.chomp.downcase
      break if %w[a b].include?(answer)

      puts 'Please choose (a) or (b).'
    end
    answer == 'a' ? Human.new : Computer.new
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (Y/N)'
      answer = gets.chomp.upcase
      break if %w[Y N].include?(answer)

      puts "I don't understand."
    end
    answer == 'Y'
  end
end

# board
class Grid
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @spaces = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  end

  def open_spaces
    open_spaces = []
    @spaces.each do |space, marker|
      open_spaces << space if marker == ' '
    end
    open_spaces
  end

  def display_board
    puts '  1|  2|  3'
    puts " #{@spaces[1]} | #{@spaces[2]} | #{@spaces[3]} "
    puts '___|___|___'
    puts '  4|  5|  6'
    puts " #{@spaces[4]} | #{@spaces[5]} | #{@spaces[6]} "
    puts '___|___|___'
    puts '  7|  8|  9'
    puts " #{@spaces[7]} | #{@spaces[8]} | #{@spaces[9]} "
    puts '   |   |   '
  end

  def clear_screen_display_board
    system 'clear'
    display_board
  end

  def place_marker(square, marker)
    @spaces[square] = marker
  end

  def full?
    open_spaces.empty?
  end

  def three_in_a_row?
    WINNING_CONDITIONS.any? do |condition|
      line = [@spaces[condition[0]], @spaces[condition[1]], @spaces[condition[2]]]
      line.uniq.size == 1 && (line.uniq[0] != ' ')
    end
  end

  def reset
    @spaces = { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
  end
end

# player
class Player
  attr_writer :marker
  attr_reader :name, :marker

  def initialize
    @marker = nil
    @name = select_name
  end

  def select_name
    name = nil
    loop do
      puts "Please enter this player's name."
      name = gets.chomp
      break if !name.empty? && name.split('').any? { |char| char != ' ' }

      puts 'No name detected.'
    end
    name
  end
end

# human player
class Human < Player
  def choose_placement(grid_spaces)
    puts 'Choose one of the following open spaces to place your marker:'
    choice = nil
    loop do
      puts "#{grid_spaces.join(', ')}."
      choice = gets.chomp.to_i
      break if grid_spaces.include?(choice)

      puts 'Not a valid choice. Please try again.'
    end
    choice
  end
end

# computer player
class Computer < Player
  def choose_placement(grid_spaces)
    grid_spaces.sample
  end
end

TTTGame.new.play
