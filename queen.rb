# frozen_string_literal: true

require_relative 'piece'

class Queen < Piece
    attr_reader :symbol
    
    def initialize(color, position)
        super
        case @color
        when "black"
            @symbol = "\u265B"
        when "white"
            @symbol = "\u2655"
        end
    end 

    def moves(vertDist, horizDist)
        (abs(vertDist) > 0 && horizDist == 0) ||
        (vertDist == 0 && abs(horizDist) > 0) ||
        abs(vertDist) == abs(horizDist)
    end 
end