require "active_support/all"
require_relative "piece"

class Board
    BACK_ROW = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    attr_reader :grid
    def initialize()
        @grid = Array.new(8){Array.new(8)}
    end
    def [](pos)
        x,y = pos
        @grid[x][y]
    end
    def []=(pos, piece)
        x, y = pos
        @grid[x][y] = piece
    end
    def move_piece(start_pos, end_pos, color)
        piece = self[start_pos]
        if piece.moves.exclude?(end_pos)
            raise "Invalid move"
        end
        if self.empty?(start_pos)
            raise "empty position"
        end
        piece.pos = end_pos
    end
end
