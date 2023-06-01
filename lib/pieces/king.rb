# frozen_string_literal: true

require_relative 'piece'
require_relative 'stepable'
require_relative '../board'

# create king
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
