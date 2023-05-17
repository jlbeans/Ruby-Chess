# frozen_string_literal: true

require_relative 'piece'

class Knight < Piece
  attr_reader :symbol

  def initialize(color, position)
    super
    case @color
    when 'black'
      @symbol = "\u265E"
    when 'white'
      @symbol = "\u2658"
    end
  end

  def moves(vertDist, horizDist)
    (abs(vertDist) == 1 && abs(horizDist) == 2) ||
    (abs(vertDist )== 2 && abs(horizDist) == 1)
  end 
end
