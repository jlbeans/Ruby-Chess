# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'invalid'

# This class controls the game flow
class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play
    #until in check or in stalemate
    loop do
      board.display
      puts "It's #{current_player.name}'s turn"
      turn(current_player)
      switch_players
    end
  end

  def turn(player)
    from_squ = nil

    loop do
      puts 'Select a piece to move(e.g. 1, A)'
      from_squ = player.pos_input
      puts from_squ
      break unless board[from_squ].nil? && board[from_squ].color != current_player.color

      puts "That's not your piece!"
    end

    loop do
      puts 'Select a position to move to'
      to_squ = player.pos_input
      puts to_squ

      begin
        board.move_piece(from_squ, to_squ)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end

  def switch_players
    self.current_player = (if current_player == player1
                             player2
                           else
                             player1
                           end)
  end

  def in_check?(player)
    #color = player.color
    #king = {King.color}.position
    #other_player_pieces = {Piece.color != color}.all 
    #do any other_player_pieces.available_moves.include(king)?
  end 

  def in_stalemate?
    #current player cannot move any pieces without making their king in check
  end 
end

#
#   def play
#     @current_player = player_one
#     until board.board_full?
#       turn(current_player)
#       break if board.winner?
#
#       @current_player = switch_players
#     end
#   end
#
#
# def game_over
#   if board.winner?
#     print_win_message(current_player)
#   else
#     print_tie_message
#   end
# end
#
# def print_win_message(player)
#   puts "Congratulations #{player.marker}, you win!"
# end
#
# def print_tie_message
#   puts 'No winner, better luck next time...'
# end
#
# def repeat
#   puts 'Play again? Please enter (y/n):'
#   response = gets.chomp
#   if response == 'y'
#     initialize
#     start_game
#   else
#     puts 'Thanks for playing!'
#   end
# end
# =
