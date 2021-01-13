class Card
  include Comparable
  
  CARD_HIERARCHY = [2, 3, 4, 5, 6, 7, 8, 9, 10, 
                    'Jack', 'Queen', 'King', 'Ace'].freeze
  
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other)
    CARD_HIERARCHY.index(rank) <=> CARD_HIERARCHY.index(other.rank)
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :cards

  def initialize
    @cards = []
    reset
  end

  def draw
    reset if cards.empty?
    cards.pop
  end

  private

  def create_deck
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new(rank, suit)
      end
    end
  end

  def reset
    create_deck
    cards.shuffle!
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2

