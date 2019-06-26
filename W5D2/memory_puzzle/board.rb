require_relative "card"

class Board
    @@FACE_VALUES = [:K, :Q, :J, :A, :T, :S, :P, :L]
    attr_accessor :grid
    def initialize
        @grid = Array.new(4) {Array.new(4)}        
        
    end

    def populate
        @@FACE_VALUES.each do |card|
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

    def [](pos)
        i, j = pos
        @grid[i][j]
    end

    def []=(pos, card)
        i, j = pos
        @grid[i][j] = card
    end
    def render
        print "**************"
        puts
        print "  0 1 2 3"
        puts
        i = 0
        @grid.each do |row|
            print i.to_s, " "
            row.each do |card|
                if card.face_up
                    print card.face_value.to_s + " "
                else
                    print "  "
                end
            end
            i += 1
            puts
        end
    end
    def won?
        @grid.all? do |row|
            row.all? {|card| card.face_up}
        end
    end
    
    def reveal(pos)
        i, j = pos
        if !@grid[i][j].face_up
            @grid[i][j].reveal
        end
    end


    def matched(pos) 
        i, j = pos
    
        if @grid[i][j].face_up 
            true         
        end
    
        false
        
    end

    def valid_move(pos1, pos2)
        if matched(pos1) && matched(pos2)
            puts "pick a new coordinate"
            return false
        end
        true
    end
end