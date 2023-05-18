# frozen_string_literal: true

require './piece'
require './slideable'

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

  def enemy?(position)
    !board[position].empty? && !board[position].color.self?
  end
end
