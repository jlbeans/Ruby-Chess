# frozen_string_literal: true

require_relative '../board'

# for pieces that can only move one step at a time
module Stepable
  def available_moves
    moves = []
    directions.each do |(row, column)|
      current_row, current_column = position

      current_row += row
      current_column += column
      next_position = [current_row, current_column]
      next unless board.in_bounds?(next_position)

      moves << next_position if board.empty?(next_position) || enemy?(next_position)
    end
    moves
  end
end
