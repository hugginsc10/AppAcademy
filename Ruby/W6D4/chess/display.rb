require 'colorize'
require_relative 'cursor'

class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
        @notifications = notifications
    end
end