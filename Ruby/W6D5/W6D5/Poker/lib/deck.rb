require_relative 'card'

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    my_deck = []
    suits = [ :clubs, :diamonds, :hearts, :spades ]
    value = [:deuce,:three,:four,:five,:six,:seven,:eight,:nine,:ten,:jack,:queen,:king,:ace]
    suits.each do |suit|
      value.each do |val|
        my_deck << Card.new(suit, val) 
      end
    end
    my_deck
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.length
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
    res = []
    while res.length < n
      res << @cards.shift
      raise "not enough cards" if count == 0 && res.length < n
    end
    res
  end

  # Returns an array of cards to the bottom of the deck.
  def return(cards)
    @cards += cards

  end
end
