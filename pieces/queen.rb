# frozen_string_literal: true

require './piece'
require './slideable'

class Queen < Piece
  include Slideable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265B" : "\u2655"
  end

  def directions
    [
      [1, 1],
      [1, -1],
      [-1, -1],
      [-1, 1],
      [1, 0],
      [-1, 0],
      [0, -1],
      [0, 1]
    ]
  end
end
