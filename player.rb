# frozen_string_literal: true

class Player
  attr_reader :color, :name

  COLUMNS = {
    A: 0,
    B: 1,
    C: 2,
    D: 3,
    E: 4,
    F: 5,
    G: 6,
    H: 7
  }.freeze

  def initialize(color, name)
    @color = color
    @name = name
  end

  def row_input_to_index(n)
    number = n.to_i
    number - 1
  end

  def column_input_to_index(l)
    COLUMNS[l.to_sym]
  end

  def pos_input
    input = gets.chomp
    input_arr = input.split(',').collect(&:strip)
    row = row_input_to_index(input_arr[0])
    column = column_input_to_index(input_arr[1])
    [row, column]
  end
end
