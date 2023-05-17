# frozen_string_literal: true

require_relative 'piece'

class Rook < Piece
  attr_reader :symbol

  def initialize(color, positon)
    super
    case @color
    when 'black'
      @symbol = "\u265C"
    when 'white'
      @symbol = "\u2656"
    end
  end

  def moves(vertDist, horizDist)
    (abs(vertDist) > 0 && abs(horizDist) == 0) ||
    (abs(vertDist) == 0 && abs(horizDist) > 0)
  end 
end
