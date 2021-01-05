require 'pry'

class Player
  attr_accessor :choice
  
  def initialize(type)
    @type = type
    @choice = nil
  end

  def choose
    if human?
      valid_choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        valid_choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(valid_choice)
      end
      self.choice = valid_choice
    else
      self.choice = ['rock', 'paper', 'scissors'].sample
    end
  end

  private

  def human?
    @type == :human
  end
end

module Rules
  def compare(human_move, computer_move)
    case human_move
    when 'rock'
      if computer_move == 'scissors'
        "The human wins!"
      elsif computer_move == 'paper'
        "The computer wins!"
      end
    when 'paper'
      if computer_move == 'rock'
        "The human wins!"
      elsif computer_move == 'scissors'
        "The computer wins!"
      end
    when 'scissors'
      if computer_move == 'paper'
        "The human wins!"
      elsif computer_move == 'rock'
        "The computer wins!"
      end
    else
      "It's a tie!"
    end
  end
end

class RPSGame
  include Rules
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_winner
    puts "The human chose #{human.choice}."
    puts "The computer chose #{computer.choice}."
    puts "#{compare(human.choice, computer.choice)}"
  end
end

RPSGame.new.play