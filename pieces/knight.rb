# frozen_string_literal: true

require './piece'
require './stepable'

class Knight < Piece
  include Stepable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265E" : "\u2658"
  end

  def directions
    [
      [1, 2],
      [2, 1],
      [-1, -2],
      [-2, -1],
      [1, -2],
      [-1, 2],
      [2, -1],
      [-2, 1]
    ]
  end
end
