# frozen_string_literal: true

require './piece'
require './stepable'

class Pawn < Piece
  include Stepable
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265F" : "\u2659"
  end

  def directions
    [
      [1, 0]
    ]
  end
end
