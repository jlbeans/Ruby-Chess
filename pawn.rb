# frozen_string_literal: true

require_relative 'piece'

class Pawn < Piece
  attr_reader  :symbol

  def initialize(color, position)
    super
    case @color
    when 'black'
      @symbol = "\u265F"
    when 'white'
      @symbol = "\u2659"
    end
  end

  def moves(vertDist, horizDist)
    ((vertDist) == 1 && (horizDist) == 0) ||
    ((vertDist) == 2 && (horizDist) == 0)
  end 
end
