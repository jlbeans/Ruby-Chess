# frozen_string_literal: true

require_relative 'piece'

class Bishop < Piece
  attr_reader :symbol

  def initialize(color, position)
    super
    case @color
    when 'black'
      @symbol = "\u265D"
    when 'white'
      @symbol = "\u2657"
    end
  end

  def moves(vertDist, horizDist)
    abs(vertDist) == abs(horizDist)
  end 
end
