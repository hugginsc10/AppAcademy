require "hand"
require "card"

describe Hand do
    subject(:hand) {Hand.deal_from(deck)}
    
    describe "::deal_from" do 
        it "deals a hand of five cards" do
            deck_cards = [
                Card.new(:spades, :deuce),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.cards).to match_array(deck_cards)
        end
    end

    describe "#one_pair?" do
        it "Returns true if hand has a pair" do
            deck_cards = [
                Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.one_pair?).to eq([ Card.new(:clubs, :three),
                Card.new(:spades, :three)])
        end
    end
     describe "#full_house??" do
        it "Returns card pair if hand has a pair" do
            deck_cards = [
                Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:clubs, :five),
                Card.new(:hearts, :five),
                Card.new(:diamonds, :five)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.full_house?).to eq([ Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:clubs, :five),
                Card.new(:hearts, :five),
                Card.new(:diamonds, :five)])
        end
    end
     describe "#two_pairs?" do
        it "Returns two pairs if hand has two pair" do
            deck_cards = [
                Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:clubs, :five),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.two_pairs?).to eq([ Card.new(:clubs, :three),
            Card.new(:spades, :three), Card.new(:clubs, :five), Card.new(:spades, :five)])
        end
    end
     describe "#three_of_a_kind?" do
        it "Returns three-of-a-kind if hand has a three-of-a-kind" do
            deck_cards = [
                Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:hearts, :three),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.three_of_a_kind?).to eq([Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:hearts, :three)])
        end
    end
     describe "#straight?" do
        it "Returns true if hand has a straight" do
            deck_cards = [
                Card.new(:spades, :deuce),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.straight?).to eq([Card.new(:spades, :deuce),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)])
        end
    end
     describe "#flush?" do
        it "Returns true if hand has a flush" do
            deck_cards = [
                Card.new(:spades, :three),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.flush?).to eq([Card.new(:spades, :three),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)])
        end
    end
    describe "#four_of_a_kind?" do
        it "Returns four-of-a-kind if hand has a four-of-a-kind" do
            deck_cards = [
                Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:hearts, :three),
                Card.new(:diamonds, :three),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.four_of_a_kind?).to eq([Card.new(:clubs, :three),
                Card.new(:spades, :three),
                Card.new(:hearts, :three),
                Card.new(:diamonds, :three)])
        end
    end
    describe "#straight_flush?" do
        it "Returns straight_flush if hand has a straight_flush" do
            deck_cards = [
                Card.new(:spades, :deuce),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.straight_flush?).to eq([  Card.new(:spades, :deuce),
                Card.new(:spades, :three),
                Card.new(:spades, :four),
                Card.new(:spades, :five),
                Card.new(:spades, :six)])
        end
    end
    describe "#royal_flush?" do
        it "Returns royal_flush if hand has a royal_flush" do
            deck_cards = [
                Card.new(:spades, :ten),
                Card.new(:spades, :jack),
                Card.new(:spades, :queen),
                Card.new(:spades, :king),
                Card.new(:spades, :ace)
            ]
            deck = double("deck")
            expect(deck).to receive(:take).with(5).and_return(deck_cards)
            hand = Hand.deal_from(deck)
            expect(hand.royal_flush?).to eq([Card.new(:spades, :ten),
                Card.new(:spades, :jack),
                Card.new(:spades, :queen),
                Card.new(:spades, :king),
                Card.new(:spades, :ace)])
        end
    end
end
