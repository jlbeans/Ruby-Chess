require_relative 'board'
# frozen_string_literal: true

class Piece
  attr_reader :color, :board, :position

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = position
  end

  def enemy?(position)
    !board[position].empty? && !board[position].color != color
  end
end
