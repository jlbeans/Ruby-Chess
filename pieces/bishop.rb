# frozen_string_literal: true

require './piece'
require './slideable'

class Bishop < Piece
  include Slideable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265D" : "\u2657"
  end

  def directions
    [
      [1, 1],
      [1, -1],
      [-1, -1],
      [-1, 1]
    ]
  end
end
