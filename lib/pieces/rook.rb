# frozen_string_literal: true

require_relative 'piece'
require_relative 'slideable'
require_relative '../board'

# create rook
class Rook < Piece
  include Slideable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265C" : "\u2656"
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
