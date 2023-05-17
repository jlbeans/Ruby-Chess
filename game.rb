# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

# This class controls the game flow
class Game
  attr_reader :board, :player_one, :player_two
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @player_one = Player.new('white')
    @player_two = Player.new('black')
    @current_player = nil
  end

  def start
    board.display
  end
end

#   def start_game
#     board.display_board(board)
#     play
#     game_over
#     repeat
#   end
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
#   def turn(player)
#     index = board.input_to_index(player_input(player))
#     board.move(index, player.marker)
#     board.display_board(board)
#   end
# end
#
# def player_input(player)
#   puts "Player #{player.marker}, please enter 1-9:"
#   input = gets.chomp.to_i
#   return input if board.space_available?(input)
#
#   puts 'Invalid move, please try again.'
#   player_input(player)
# end
#
# def switch_players
#   @current_player = if current_player == player_one
#                       player_two
#                     else
#                       player_one
#                     end
# end
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
