# gameplay
class BlackjackGame
  attr_accessor :deck, :dealer, :human

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @human = Human.new
    intro_message_and_select_name
  end

  def play
    loop do
      round
      break if out_of_cash? || cash_out?

      reset
    end
    outro_message
  end

  def round
    place_bet
    initial_deal
    human_turn
    dealer_turn unless human.hand.busted?
    compare_hands
  end

  private

  def outro_message
    prompt("You won $#{human.balance - 100}!")
    prompt('Thanks for playing! Goodbye.')
  end

  def cash_out?
    answer = nil
    prompt('Would you like to [c] cash out, or [p] keep playing?')
    loop do
      answer = input.downcase
      break if %w(c p).include?(answer)

      display
      prompt('Try again. Would to [c] cash out, or [p] keep playing?')
    end
    answer == 'c'
  end

  def out_of_cash?
    human.balance.zero?
  end

  def prompt(message)
    puts "==> #{message}".center(55)
  end

  def input
    print ' ' * 27
    gets.chomp
  end

  def intro_message_and_select_name
    name = nil
    clear_screen
    prompt('WELCOME TO BLACKJACK!')
    prompt('Enter your name to get started.')
    loop do
      name = input
      break if valid_name?(name) && name.length < 25

      clear_screen
      prompt('WELCOME TO BLACKJACK!')
      prompt('Try again. Enter your name to get started.')
    end
    human.name = name
  end

  def valid_name?(name)
    !name.empty? && !name.split('').all? { |char| char == ' ' }
  end

  def clear_screen
    system 'clear'
  end

  def display
    clear_screen
    display_table(dealer.name, dealer.hand)
    display_table(human.name, human.hand)
    display_bet_and_balance
  end

  def display_bet_and_balance
    puts '-' * 55
    puts '|' + "BET: $#{human.bet}".center(26) + '|' +
         "BALANCE: $#{human.balance}".center(26) + '|'
    puts '_' * 55
  end

  def display_table(name, hand)
    puts '-' * 55
    display_hand(hand)
    display_name(name)
  end

  def display_hand(hand)
    card_display = ['', '', '', '', '']
    hand.cards.each_with_index do |card, i|
      card_display[0] += '+---+'
      card_display[1] += "| #{card.suit} |"
      card_display[2] += '+---+'
      card_display[3] += '|' + card.value.to_s.center(3) + '|'
      card_display[4] += '+---+'
      if i < hand.cards.length - 1
        card_display.each { |line| line + ' ' }
      end
    end
    card_display.each do |line|
      puts '|' + line.to_s.center(53) + '|'
    end
  end

  def display_name(name)
    puts '|' + ' ' * 53 + '|'
    puts '|' + name.to_s.center(53) + '|'
  end

  def place_bet
    display
    bet = nil
    prompt('What amount would you like to wager?')
    loop do
      bet = input
      break if valid_numeric_input?(bet) && valid_bet?(bet)

      display
      prompt('Try again. What amount would you like to wager?')
    end
    human.bet = bet.to_f
    human.balance -= bet.to_f
  end

  def valid_bet?(bet)
    bet.to_f <= human.balance && bet.to_f > 0
  end

  def valid_numeric_input?(bet)
    bet.to_f.to_s == bet || bet.to_i.to_s == bet
  end

  def initial_deal
    2.times do |_|
      hit(dealer)
      hit(human)
    end
    human.hand.calculate_total
    dealer.hand.calculate_total
  end

  def human_turn
    until human.hand.hand_over?
      display
      hit_or_stay
    end
  end

  def dealer_turn
    until dealer.hand.hand_over?
      display
      if dealer.hand.calculate_total >= 17
        stay(dealer)
      else
        hit(dealer)
      end
    end
  end

  def hit_or_stay
    decision = nil
    prompt('Would you like to [h] hit, or [s] stand pat?')
    loop do
      decision = input.downcase
      break if %w(h s).include?(decision)

      display
      prompt('Try again. Would you like to [h] hit, or [s] stand pat?')
    end
    case decision
    when 'h'
      hit(human)
    when 's'
      stay(human)
    end
  end

  def hit(player)
    player.hand.cards << deck.deal_card
  end

  def stay(player)
    player.hand.stay = true
  end

  def compare_hands
    if human.hand.natural_21?
      if dealer.hand.natural_21?
        tie
      else
        human_wins(2.5)
      end
    elsif human.hand.five_cards_drawn
      if dealer.hand.five_cards_drawn
        tie
      else
        human_wins(2)
      end
    elsif human.hand.busted
      dealer_wins
    elsif dealer.hand.busted
      human_wins(2)
    elsif human.hand.hand_total > dealer.hand.hand_total
      human_wins(2)
    elsif dealer.hand.hand_total > human.hand.hand_total
      dealer_wins
    elsif dealer.hand.hand_total == human.hand.hand_total
      tie
    end
  end

  def tie
    human.balance += human.bet
    display
    prompt("Dealer: #{dealer.hand.hand_total} - #{human.name}:" +
            human.hand.hand_total.to_s)
    prompt("It's a tie.")
  end

  def dealer_wins
    display
    prompt("Dealer: #{dealer.hand.hand_total} - #{human.name}:" +
            human.hand.hand_total.to_s)
    prompt('The dealer wins.')
  end

  def human_wins(bet_multiplier)
    human.balance += human.bet * bet_multiplier
    display
    prompt("Dealer: #{dealer.hand.hand_total} - #{human.name}:" +
            human.hand.hand_total.to_s)
    prompt('You win!')
  end

  def reset
    self.deck = Deck.new
    human.hand.reset
    dealer.hand.reset
    human.bet = 0
  end
end

# deck - all cards available in round
class Deck
  SUITS = ['♥', '♦', '♠', '♣'].freeze
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A).freeze
  attr_accessor :deck

  def initialize
    @deck = []
    create_52_card_deck
    deck.shuffle!
  end

  def deal_card
    deck.pop
  end

  private

  def create_52_card_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        deck << Card.new(suit, value)
      end
    end
  end
end

# individual cards in deck
class Card
  attr_accessor :suit, :value
  attr_reader :numerical_value

  def initialize(suit, value)
    @suit = suit
    @value = value
    @numerical_value = set_numerical_value
  end

  def set_numerical_value
    case value
    when 'J' then 10
    when 'Q' then 10
    when 'K' then 10
    when 'A' then 0
    else
      value.to_i
    end
  end
end

# cards that a player possesses and their cumulative status in the round
class Hand
  attr_accessor :busted, :cards, :hand_total, :five_cards_drawn, :stay

  def initialize
    @cards = [] # populated by Cards
    @stay = false
    @busted = false
    @five_cards_drawn = false
    @hand_total = 0
  end

  def hand_over?
    [busted?, five_cards_drawn?, stay].any?
  end

  def reset
    self.cards = []
    self.stay = false
    self.busted = false
    self.five_cards_drawn = false
    self.hand_total = 0
  end

  def five_cards_drawn?
    if cards.size == 5 && !busted?
      self.five_cards_drawn = true
      return true
    end
    false
  end

  def calculate_total
    num_aces = cards.count { |card| card.value == 'A' }
    total = 0
    cards.each do |card|
      total += card.numerical_value
    end
    total += value_of_aces(num_aces, total)
    self.hand_total = total
  end

  def busted?
    if calculate_total > 21
      self.busted = true
      return true
    end
    false
  end

  def value_of_aces(num_aces, total)
    case num_aces
    when 0 then 0
    else
      if total <= (21 - 11 - (num_aces - 1))
        11 + (num_aces - 1)
      else
        num_aces
      end
    end
  end

  def natural_21?
    cards.size == 2 && hand_total == 21
  end
end

# human player
class Human
  attr_accessor :name, :hand, :bet, :balance

  def initialize
    @name = nil
    @hand = Hand.new
    @bet = 0
    @balance = 100
  end
end

# computer player - the house
class Dealer
  attr_accessor :name, :hand

  def initialize
    @name = 'Dealer'
    @hand = Hand.new
  end
end

BlackjackGame.new.play
