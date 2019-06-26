require_relative "card"
require_relative "humanplayer"
require_relative "board"

class Game
    attr_reader :board, :player
    def initialize
        @player = HumanPlayer.new
        @board = Board.new
        @current_guess = []
        @previous_guess = []
        @guesses = []
    end
    def start_game
        @board.populate
    end
    def clear_screen
        system("clear")
    end
    def make_guess
        @player.guess
    end
    def play
        
        @board.render
     until @board.won?
            @previous_guess = make_guess
            @current_guess = make_guess
            until board.valid_move(@current_guess, @previous_guess)
                @previous_guess = make_guess
                @current_guess = make_guess
            end
    
        current_value = board.reveal(@current_guess)
        previous_value = board.reveal(@previous_guess)
        @board.render
        if current_value != previous_value
            board[@current_guess].hide
            board[@previous_guess].hide
        end
        @previous_guess = []
        @current_guess = []
        sleep(3)
        clear_screen
        @board.render
        end
        puts "You win!" 


    end


end
game = Game.new
game.start_game
game.play