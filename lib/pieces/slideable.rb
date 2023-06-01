# frozen_string_literal: true

require_relative '../board'

# for pieces that can move more than one space at a time
module Slideable
  def available_moves
    moves = []
    directions.each do |(row, column)|
      current_row, current_column = position

      loop do
        current_row += row
        current_column += column
        next_position = [current_row, current_column]
        break unless board.in_bounds?(next_position)

        moves << next_position if board.empty?(next_position)
        if enemy?(next_position)
          moves << next_position
          break
        end
      end
    end
    moves
  end
end
