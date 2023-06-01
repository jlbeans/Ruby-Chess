# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative './errors/invalid_input'
require_relative './errors/invalid_move'
require_relative './errors/invalid_piece'

# This class controls the game flow
class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  COLUMNS = {
    'A' => 0,
    'B' => 1,
    'C' => 2,
    'D' => 3,
    'E' => 4,
    'F' => 5,
    'G' => 6,
    'H' => 7
  }.freeze

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play
    until game_over?
      board.display
      puts "It's #{current_player.name}'s turn"
      puts "You're in check!" if board.in_check?(current_player.color)
      turn
      switch_players
    end
    board.display
    board.in_check_mate?(current_player.color) ? print_win_message : print_tie_message
  end

  def game_over?
    board.in_check_mate?(current_player.color) || board.in_stalemate?(current_player.color)
  end

  def turn
    # get piece to move
    from_squ = piece_to_move
    # get space to move to
    to_squ = move_coordinates
    board.check_valid_move(from_squ, to_squ)
  rescue InvalidMoveError => e
    puts e.message
    retry
  end

  def piece_to_move
    puts 'Select a piece to move(e.g. 1A)'
    piece_input = gets.chomp
    validate_input(piece_input)
    position = input_to_coordinates(piece_input)
    puts position
    validate_piece(position)
    position
  rescue ArgumentError => e
    puts e.message
    retry
  end

  def move_coordinates
    puts 'Select a position to move to(e.g. 2A)'
    pos_input = gets.chomp
    validate_input(pos_input)
    input_to_coordinates(pos_input)
  rescue ArgumentError => e
    puts e.message
    retry
  end

  def switch_players
    self.current_player = (if current_player == player1
                             player2
                           else
                             player1
                           end)
  end

  def print_win_message
    player = switch_players
    puts "Congratulations #{player.name}, you win!"
  end

  def print_tie_message
    puts "It's a stalemate!"
  end

  def validate_input(input)
    unless input.match?(/^[1-8][a-h]$/i)
      raise InvalidInputError,
            'Invalid input! Enter a valid row and column (e.g. 1A).'
    end
  end

  def validate_piece(position)
    unless !board[position].nil? && board[position].color == current_player.color
      raise InvalidPieceError,
            "That's not your piece!"
    end
  end

  def input_to_coordinates(input)
    input_arr = input.split('')
    row = row_input_to_index(input_arr[0])
    column = column_input_to_index(input_arr[1])
    [row, column]
  end

  def row_input_to_index(n)
    number = n.to_i
    number - 1
  end

  def column_input_to_index(l)
    letter = l.upcase
    COLUMNS[letter]
  end
end
