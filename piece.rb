# frozen_string_literal: true

require_relative 'board'
# frozen_string_literal: true

class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = position
  end

  def enemy?(position)
    !board[position].nil? && board[position].color != color
  end
end
