# frozen_string_literal: true

require_relative 'piece'
require_relative 'stepable'
require_relative '../board'

# create knight
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
