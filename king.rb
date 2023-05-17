# frozen_string_literal: true

require_relative 'piece'

class King < Piece
  attr_reader :symbol

  def initialize(color, position)
    super
    case @color
    when 'black'
      @symbol = "\u265A"
    when 'white'
      @symbol = "\u2654"
    end
  end

  def moves(vertDist, horizDist)
    (abs(vertDist) == 1 && (horizDist) == 0) ||
    ((vertDist) == 0 && abs(horizDist) == 1)
  end 
end
