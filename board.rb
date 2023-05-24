# frozen_string_literal: true

require './pieces/rook'
require './pieces/knight'
require './pieces/bishop'
require './pieces/queen'
require './pieces/king'
require './pieces/pawn'
require_relative 'piece'
require_relative 'invalid'

class Board
  attr_reader :grid

  def self.fill
    board = new
    board[[0, 0]] = Rook.new(board, :white, [0, 0])
    board[[0, 7]] = Rook.new(board, :white, [0, 7])
    board[[0, 1]] = Knight.new(board, :white, [0, 1])
    board[[0, 6]] = Knight.new(board, :white, [0, 6])
    board[[0, 2]] = Bishop.new(board, :white, [0, 2])
    board[[0, 5]] = Bishop.new(board, :white, [0, 5])
    board[[0, 3]] = Queen.new(board, :white, [0, 3])
    board[[0, 4]] = King.new(board, :white, [0, 4])
    8.times { |i| board[[1, i]] = Pawn.new(board, :white, [1, i]) }
    board[[7, 0]] = Rook.new(board, :black, [7, 0])
    board[[7, 7]] = Rook.new(board, :black, [7, 7])
    board[[7, 1]] = Knight.new(board, :black, [7, 1])
    board[[7, 6]] = Knight.new(board, :black, [7, 6])
    board[[7, 2]] = Bishop.new(board, :black, [7, 2])
    board[[7, 5]] = Bishop.new(board, :black, [7, 5])
    board[[7, 3]] = Queen.new(board, :black, [7, 3])
    board[[7, 4]] = King.new(board, :black, [7, 4])
    8.times { |i| board[[6, i]] = Pawn.new(board, :black, [6, i]) }
    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location

    row < grid.length &&
      column < grid.first.length &&
      row >= 0 &&
      column >= 0
  end

  def display
    row8 = filter(grid[7]).join(' ')
    row7 = filter(grid[6]).join(' ')
    row6 = filter(grid[5]).join(' ')
    row4 = filter(grid[3]).join(' ')
    row5 = filter(grid[4]).join(' ')
    row3 = filter(grid[2]).join(' ')
    row2 = filter(grid[1]).join(' ')
    row1 = filter(grid[0]).join(' ')

    puts "
      \e[1;47m\e[1;30m⚉ A B C D E F G H ⚉\e[0m
      \e[1;47m\e[1;30m8 #{row8} 8\e[0m
      \e[1;47m\e[1;30m7 #{row7} 7\e[0m
      \e[1;47m\e[1;30m6 #{row6} 6\e[0m
      \e[1;47m\e[1;30m5 #{row5} 5\e[0m
      \e[1;47m\e[1;30m4 #{row4} 4\e[0m
      \e[1;47m\e[1;30m3 #{row3} 3\e[0m
      \e[1;47m\e[1;30m2 #{row2} 2\e[0m
      \e[1;47m\e[1;30m1 #{row1} 1\e[0m
      \e[1;47m\e[1;30m⚉ A B C D E F G H ⚉\e[0m
    "
  end

  def empty?(location)
    row, column = location
    grid[row][column].nil?
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    raise InvalidMoveError, 'Out of bounds!' unless in_bounds?(end_pos)
    raise InvalidMoveError, 'Unavailable move!' unless piece.available_moves.include?(end_pos)

    self[start_pos] = nil
    self[end_pos] = piece
    piece.position = end_pos
  end

  private

  def filter(row)
    row.map do |position|
      if !position.nil?
        position.symbol
      else
        '-'
      end
    end
  end
end
