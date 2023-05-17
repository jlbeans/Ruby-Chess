# frozen_string_literal: true
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'
require_relative 'queen'
require_relative 'king'
require_relative 'pawn'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, '-') }
    place_pieces
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

  def place_pieces
    grid[0][0] = Rook.new('white', [0, 0])
    grid[0][7] = Rook.new('white', [0, 7])
    grid[0][1] = Knight.new('white', [0, 1])
    grid[0][6] = Knight.new('white', [0, 6])
    grid[0][2] = Bishop.new('white', [0, 2])
    grid[0][5] = Bishop.new('white', [0, 5])
    grid[0][3] = Queen.new('white', [0, 3])
    grid[0][4] = King.new('white', [0, 4])
    8.times { |i| grid[1][i] = Pawn.new('white', [1, i]) }
    grid[7][0] = Rook.new('black', [7, 0])
    grid[7][7] = Rook.new('black', [7, 7])
    grid[7][1] = Knight.new('black', [7, 1])
    grid[7][6] = Knight.new('black', [7, 6])
    grid[7][2] = Bishop.new('black', [7, 2])
    grid[7][5] = Bishop.new('black', [7, 5])
    grid[7][3] = Queen.new('black', [7, 3])
    grid[7][4] = King.new('black', [7, 4])
    8.times { |i| grid[6][i] = Pawn.new('black', [6, i]) }
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

  def filter(row)
    row.map do |position|
      if !position.is_a? String  
        position.symbol 
      else 
        position
      end 
    end 
  end 
end
