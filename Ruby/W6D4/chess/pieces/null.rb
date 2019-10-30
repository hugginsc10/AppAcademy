require_relative "piece"

class NullPiece < Piece
    attr_reader :symbol
    include singleton
    def initialize 
        @symbol = nil
        @color = :none
    end

    def empty?
        true
    end
    def moves
        []
    end
end