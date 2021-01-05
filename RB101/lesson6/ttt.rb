AI_MARKER = 'O'
HUMAN_MARKER = 'X'
WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                      [1, 4, 7], [2, 5, 8], [3, 6, 9],
                      [1, 5, 9], [3, 5, 7]]

def display_board(board)
  system 'clear'
  puts "1      |2      |3      "
  puts "   #{board[1]}   |   #{board[2]}   |   #{board[3]}   "
  puts "_______|_______|_______"
  puts "4      |5      |6      "
  puts "   #{board[4]}   |   #{board[5]}   |   #{board[6]}   "
  puts "_______|_______|_______"
  puts "7      |8      |9      "
  puts "   #{board[7]}   |   #{board[8]}   |   #{board[9]}   "
  puts "       |       |       "
end

def prompt(message)
  puts '==> ' + message
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == ' ' }
end

def joinor(keys, punctuation=',', connecting_word='or')
  last = keys.pop
  keys.join("#{punctuation} ") + ", #{connecting_word} #{last}."
end

def human_places_piece!(brd)
  square = nil
  loop do
    prompt "Choose a position to place a piece: #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Invalid choice. Please try again."
    end
  end

  brd[square] = HUMAN_MARKER
end

def ai_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = AI_MARKER
end

def board_full?(brd)
  empty_squares(brd).size == 0
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winner = nil
  WINNING_CONDITIONS.each do |line|
    if brd[line[0]] == brd[line[1]] &&
       brd[line[1]] == brd[line[2]] &&
       brd[line[0]] != ' '
      winner = brd[line[0]] == HUMAN_MARKER ? 'You' : 'The AI'
    end
  end
  winner
end

loop do
  board = initialize_board
  display_board(board)

  loop do
    human_places_piece!(board)
    display_board(board)
    break if winner?(board) || board_full?(board)
    ai_places_piece!(board)
    display_board(board)
    break if winner?(board) || board_full?(board)
  end

  if winner?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  break if answer != 'y'
end

prompt "Thanks for playing!"
