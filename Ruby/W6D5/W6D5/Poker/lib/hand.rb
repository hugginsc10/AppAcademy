require_relative "deck"
require_relative "card"
require 'byebug'
class Hand
    attr_reader :cards
    MY_VALUE = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "11",
    :queen => "12",
    :king  => "13",
    :ace   => "14"
  }
    def self.deal_from(deck)
        Hand.new(deck.take(5))
    end
    def initialize(cards)
        @cards = cards
    end

  def royal_flush?
    vs = []
    @cards.each do |card|
        vs << MY_VALUE[card.value]
    end
    
    royal = ["10", "11", "12", "13", "14"]
    if straight_flush? && vs == royal
        return @cards 
    end
  end

  def straight_flush?
    return @cards if straight? and @cards.map(&:suit).uniq.size == 1
  end

  def four_of_a_kind?
    x_of_a_kind?(4)
  end

  def full_house?
    return @cards if three_of_a_kind? and Hand.new(@cards - three_of_a_kind?).one_pair?
    
  end

  def flush?
    return @cards if @cards.map(&:suit).uniq.size == 1
  end

  def straight?
    vs = []
    @cards.each do |card|
        vs << MY_VALUE[card.value].to_i
    end
    vs.sort
    # vs = Card.values.map(&:).sort
    if vs == (vs.min..vs.max).to_a
        return @cards 
    end
  end

  def three_of_a_kind?
    x_of_a_kind?(3)
  end

  def two_pairs?
    if (first_pair = one_pair?) && (second = Hand.new(@cards - one_pair?).one_pair?)
      return first_pair + second
    else
      return false
    end
  end

  def one_pair?
    x_of_a_kind?(2)
  end

  def high_card?
    @cards.sort_by{|c| c.value}.last
  end

  private
  def x_of_a_kind?(x)
    Card.values.each do |v|
      if (ary = @cards.select{|c| c.value == v}).size == x
        return ary
      end
    end
    return false
  end
end