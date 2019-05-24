class Player
    def guess
        puts "Enter the X, Y coordinates for a card.  ie: 1 2"
        gets.chomp.split(" ").map(&:to_i)
    end

end