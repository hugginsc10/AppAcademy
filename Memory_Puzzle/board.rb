require_relative "card"
require "byebug"
class Board
    @@CARD_VALUES = [:P, :L, :T, :D, :Q, :K, :A, :M]
    attr_accessor :grid
    def initialize
        @grid = Array.new(4) {Array.new(4)}
    end
    
    def populate
        @@CARD_VALUES.each do |card|
            (0..1).each do |m| 
                i = rand(0...4)
                print i
                j = rand(0...4)
                print j
                until @grid[i][j].nil?
                    i = rand(0...4)
                    j = rand(0...4)
                end 
                @grid[i][j] = Card.new(card)
              
            end
        end
        print grid
    end

    def [](position)
        i, j = position
        @grid[i][j]
    end

    def []=(position, card)
        i, j = position
        @grid[i][j] = card
    end

    def render
        print "****************"
        puts
        print "  0 1 2 3"
        puts
        i=0
        @grid.each do |row| 
             print i.to_s," "
            row.each do |card| 
                if card.face_up
                    print card.card_value.to_s + " "
                else
                    print "  "
                end
            end
            i+=1
            puts
        end
    end

    def won?
        @grid.all? do |row|
            row.all? {|card| card.face_up }
        end
       
    end
 
    def reveal(position)
        i, j = position
        if !@grid[i][j].face_up
            @grid[i][j].reveal
        end
     
    end
    
end

#populate should fill the board with a set of shuffled Card pairs
#render should print out a representation of the Board's current state
#won? should return true if all cards have been revealed.
#reveal should reveal a Card at guessed_pos (unless it's
# already face-up, in which case the method should do nothing). I
#also return the value of the card it revealed (you'll see why later).


