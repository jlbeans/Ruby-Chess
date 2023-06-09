# frozen_string_literal: true

require_relative '../board'

# create piece class which pieces inherit from
class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(board, color, position)
    @board = board
    @color = color
    @position = position
  end

  def valid_moves
    moves = []
    available_moves.each do |move|
      fake_board = board.dup
      fake_board.move_piece(position, move)
      moves << move unless fake_board.in_check?(color)
    end
    moves
  end

  def enemy?(position)
    !board[position].nil? && board[position].color != color
  end

  def current_row
    position.first
  end

  def current_column
    position.last
  end
end
