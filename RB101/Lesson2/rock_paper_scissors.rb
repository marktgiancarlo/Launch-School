CHOICES = %w[scissors paper rock lizard spock].freeze

def prompt(message)
  puts("=> #{message}")
end

def determine_results(player, computer)
  player_index = CHOICES.find_index(player)
  computer_index = CHOICES.find_index(computer)
  if player_index == (computer_index -  1) % CHOICES.length || player_index == (computer_index - 3) % CHOICES.length
    'player'
  elsif player_index == (computer_index + 1) % CHOICES.length || player_index == (computer_index + 3) % CHOICES.length
    'computer'
  else
    'tie'
  end
end

def display_results(result)
  case result
  when 'player' then prompt('You won this hand!')
  when 'computer' then prompt('The computer won this hand!')
  when 'tie' then prompt('This hand was a tie!')
  end
end

def display_score(score1, score2)
  prompt("Player: #{score1} | Computer: #{score2}")
  if score1 == 4 && score2 == 4
    prompt('Next point wins!')
  end
end

def display_choices(choice1, choice2)
  prompt("You chose: #{choice1} | Computer chose: #{choice2}")
end

def winner?(score1, score2)
  score1 == 5 || score2 == 5
end

def display_winner(score1)
  if score1 == 5
    prompt('You beat the computer!')
  else
    prompt('The computer beat you!')
  end
end

# game of first to 5
loop do
  player_score = 0
  computer_score = 0
  prompt('Welcome. The first player to 5 wins the game!')

  # gameplay of each hand
  loop do
    player_choice = nil

    # player input validation
    loop do
      prompt("Choose one: #{CHOICES.join(', ')}")
      player_choice = gets.chomp
      break if CHOICES.include?(player_choice.downcase)

      prompt('Please enter a valid choice')
    end

    computer_choice = CHOICES.sample

    display_choices(player_choice, computer_choice)
    winner = determine_results(player_choice, computer_choice)
    display_results(winner)
    # update score
    winner == 'player' ? player_score += 1 : computer_score += 1
    display_score(player_score, computer_score)
    break if winner?(player_score, computer_score)
  end

  display_winner(player_score)

  # play again?
  prompt('Do you want to play again? (y/n)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing!')
