# frozen_string_literal: true

require './piece'
require './stepable'

class King < Piece
  include Stepable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265A" : "\u2654"
  end

  def directions
    [
      [1, 0],
      [-1, 0],
      [0, -1],
      [0, 1]
    ]
  end
end
