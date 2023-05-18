# frozen_string_literal: true

module Stepable
  def available_moves
    moves = []
    directions.each do |(row, column)|
      current_row, current_column = position

      loop do
        current_row += row
        current_column += column
        next_position = [current_row, current_column]
        next unless board.in_bounds(next_position)

        moves << next_position if board.empty?(next_position) || enemy?(next_position)
      end
    end
    moves
  end
end
