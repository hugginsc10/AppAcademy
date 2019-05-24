require_relative "card"
require_relative "board"
require_relative "humanplayer"
#require "byebug"


class Game
    attr_reader :board, :player
    def initialize
        @player = Player.new
        @board = Board.new
        @guessed_pos = []
        @previous_guess = []
        @guesses = []
    end
    def start_game
        @board.populate
        @board.render
    end

    def play
        @board.render
       until @board.won?
          @previous_guess = make_guess
          @guessed_pos = make_guess
          current_value = board.reveal(@guessed_pos) 
          prev_value = board.reveal(@previous_guess)
          @board.render
          if current_value != prev_value 
            board[@guessed_pos].hide
            board[@previous_guess].hide
          end
          @previous_guess = [] 
          @guessed_pos = []
          sleep(2)
          clear_screen
          @board.render
        end 
        puts "You found all the card matches!"
    end

    def clear_screen
        system("clear")
    end
    

    def make_guess
       player.guess
    end
    
end