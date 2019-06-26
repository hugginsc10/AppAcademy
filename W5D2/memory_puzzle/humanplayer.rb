class HumanPlayer
    def guess
        puts "Enter the X, Y coordinates for your card choice: ie. 0 0"
        guessed = gets.chomp.split(" ").map(&:to_i)
    end

end