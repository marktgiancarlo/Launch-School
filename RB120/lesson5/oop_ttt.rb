require 'io/console'

# gameplay
class TTTGame
  attr_accessor :board

  def initialize
    display_intro_message
    @board = Grid.new
    @player_one = create_player
    @player_two = create_player
    @current_player = nil
    @rounds_to_win = rounds_to_win
    @first_player_in_round = nil
    @most_recent_move = nil
  end

  def play
    loop do
      main_game
      play_again? ? reset_game : break
    end
    display_outro_message
  end

  private

  def prompt(message)
    puts '==> ' + message
  end

  def main_game
    loop do
      round
      break if end_of_game?
    end
    display_winner
  end

  def round
    loop do
      board.clear_screen_display_board
      first_player_in_round if board.open_spaces.size == 9
      break if end_of_round?

      if board.open_spaces.size != 9
        display_previous_move
        move_to_next_player
      end
      current_player_turn
    end
    update_and_display_round_result
    display_game_score
    board.reset
  end

  def rounds_to_win
    prompt('What are we playing to? Enter the number of rounds a player must win to achieve victory:')
    answer = nil
    loop do
      answer = gets.chomp.to_i
      break if (1..10).include?(answer)

      prompt('Try again. Please enter a number between 1 and 10:')
    end
    answer
  end

  def display_previous_move
    prompt("#{@current_player.name} chose square ##{@most_recent_move}.")
  end

  def first_player_in_round
    @first_player_in_round = [@player_one, @player_two].sample
    if (@player_one.score + @player_two.score).zero?
      prompt("By luck of the draw #{@first_player_in_round.name} has been selected to go first.")
    else
      prompt("#{@first_player_in_round.name} will go first this round.")
    end
    @current_player = @first_player_in_round
  end

  def current_player_turn
    prompt("It's #{@current_player.name}'s turn!")
    choice = @current_player.choose_placement(@board.open_spaces, @board)
    board.place_marker(choice, @current_player.marker)
    @most_recent_move = choice
  end

  def move_to_next_player
    @current_player = case @current_player
                      when @player_one
                        @player_two
                      else
                        @player_one
                      end
  end

  def end_of_round?
    board.full? || board.three_in_a_row?
  end

  def update_and_display_round_result
    if @board.full? && !@board.three_in_a_row?
      prompt("It's a tie!")
    else
      prompt("#{@current_player.name} wins!")
      @current_player.score += 1
    end
  end

  def display_intro_message
    prompt('Welcome to TicTacToe!')
    prompt("Let's create our two players.")
  end

  def display_outro_message
    prompt('Thanks for playing! Goodbye.')
  end

  def display_game_score
    prompt("The score is #{@player_one.name}:#{@player_one.score} to #{@player_two.name}:#{@player_two.score}")
    prompt('Press any key to continue.')
    STDIN.getch
  end

  def create_player
    answer = nil
    prompt('Create a new player:')
    prompt('Is this player a (a) human, or (b) computer?')
    loop do
      answer = gets.chomp.downcase
      break if %w[a b].include?(answer)

      prompt('Please choose (a) human or (b) computer.')
    end
    answer == 'a' ? Human.new : Computer.new
  end

  def end_of_game?
    @player_one.score == @rounds_to_win || @player_two.score == @rounds_to_win
  end

  def display_winner
    case @player_one.score
    when @rounds_to_win
      prompt("#{@player_one.name} wins this time! Good game.")
    else
      prompt("#{@player_two.name} wins this time! Good game.")
    end
  end

  def play_again?
    answer = nil
    loop do
      prompt('Would you like to play again? (Y/N)')
      answer = gets.chomp.upcase
      break if %w[Y N].include?(answer)

      prompt("I don't understand.")
    end
    answer == 'Y'
  end

  def reset_game
    if format_of_new_game == 'new'
      prompt("Let's start over, shall we?")
      Player.names = []
      Player.markers = []
      @player_one = create_player
      @player_two = create_player
      @rounds_to_win = rounds_to_win
    else
      @player_one.score = 0
      @player_two.score = 0
    end
    @board.reset
    @first_player_in_round = nil
    @most_recent_move = nil
    @current_player = nil
  end

  def format_of_new_game
    prompt('Would you like to...')
    prompt('[a] start a fresh game, or...')
    prompt('[b] play again with the same players and numbers of rounds?')
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w[a b].include?(answer)

      prompt('Please enter [a] start a fresh game, or [b] play again with the same format.')
    end
    answer == 'a' ? 'new' : 'old'
  end
end

# board
class Grid
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  attr_reader :spaces

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
  @@names = []
  @@markers = []

  attr_accessor :score
  attr_reader :name, :marker

  def initialize
    @name = select_name
    @marker = select_marker
    @score = 0
  end

  def self.names=(names)
    @@names = names
  end

  def self.markers=(markers)
    @@markers = markers
  end

  def prompt(message)
    puts '==> ' + message
  end

  def select_name
    name = nil
    loop do
      prompt("Please enter this player's name.")
      name = gets.chomp
      if name.empty? || name.split('').all? { |char| char == ' ' }
        prompt('No name detected.')
      elsif @@names.include?(name)
        prompt('Name taken. Please try again.')
      else
        break
      end
      break if br
    end
    @@names << name
    name
  end

  def select_marker
    marker = nil
    prompt('Please enter the character this player will use as their marker.')
    loop do
      marker = gets.chomp
      if marker.size != 1 || ['', ' '].include?(marker)
        prompt('Not valid. Please enter a single character to use as a marker:')
      elsif @@markers.include?(marker)
        prompt('That marker is already taken. Please try again.')
      else
        break
      end
    end
    @@markers << marker
    marker
  end
end

# human player
class Human < Player
  def choose_placement(grid_spaces, _)
    prompt('Choose one of the following open spaces to place your marker:')
    choice = nil
    loop do
      prompt("#{grid_spaces.join(', ')}.")
      choice = gets.chomp
      break if grid_spaces.include?(choice.to_f)

      prompt('Not a valid choice. Please try again.')
    end
    choice.to_i
  end
end

# computer player
class Computer < Player
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def choose_placement(grid_spaces, board)
    winning_square = winning_square(board)
    at_risk_square = losing_square(board)
    choice = if winning_square
               winning_square
             elsif at_risk_square
               at_risk_square
             elsif grid_spaces.include?(5)
               5
             else
               grid_spaces.sample
             end
    prompt("Press any key to see where the computer player placed it's marker.")
    STDIN.getch
    choice
  end

  private

  def winning_square(board)
    # 2 of comp marker and an empty square in a line
    winning_square = nil
    WINNING_CONDITIONS.each do |line|
      comp_marker_count = 0
      empty_square_count = 0
      empty_square = nil
      line.each do |square|
        if board.spaces[square] == marker
          comp_marker_count += 1
        elsif board.spaces[square] == ' '
          empty_square_count += 1
          empty_square = square
        end
      end
      if comp_marker_count == 2 && empty_square_count == 1
        winning_square = empty_square
        break
      end
    end
    winning_square
  end

  def losing_square(board)
    losing_square = nil
    WINNING_CONDITIONS.each do |line|
      opp_marker_count = 0
      empty_square_count = 0
      empty_square = nil
      line.each do |square|
        if board.spaces[square] != marker && board.spaces[square] != ' '
          opp_marker_count += 1
        elsif board.spaces[square] == ' '
          empty_square_count += 1
          empty_square = square
        end
      end
      if opp_marker_count == 2 && empty_square_count == 1
        losing_square = empty_square
        break
      end
    end
    losing_square
  end
end

TTTGame.new.play
