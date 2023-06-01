# frozen_string_literal: true

require_relative 'piece'
require_relative '../board'

# create pawn
class Pawn < Piece
  attr_reader :symbol

  def initialize(board, color, position)
    super
    @symbol = color == :black ? "\u265F" : "\u2659"
  end

  def dir
    color == :white ? 1 : -1
  end

  def available_moves
    moves = []
    current_row, current_column = position
    moves << [(current_row + (dir * 2)), current_column] if starting_pos?(current_row)
    moves << [(current_row + dir), current_column]
    moves.keep_if { |move| board.in_bounds?(move) && board.empty?(move) }
    moves << [(current_row + dir), (current_column + 1)] if enemy?([(current_row + dir), (current_column + 1)])
    moves << [(current_row + dir), (current_column - 1)] if enemy?([(current_row + dir), (current_column - 1)])
    moves
  end

  def starting_pos?(row)
    [1, 6].include?(row)
  end

  def en_passant; end
end
