require_relative "piece"

class Board
    attr_reader :rows
    def initialize()
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
        if piece.moves.none?(end_pos)
            raise "Invalid move"
        end
        if self.empty?(start_pos)
            raise "empty position"
        end
        
    end