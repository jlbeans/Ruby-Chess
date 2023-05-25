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
    until game_over?
      board.display
      puts "It's #{current_player.name}'s turn"
      if board.in_check?(current_player.color)
        puts "You're in check!"
      end 
      turn(current_player)
      switch_players
    end
    board.display
    board.in_check_mate?(current_player.color) ? print_win_message : print_tie_message
  end

  def game_over?
    board.in_check_mate?(current_player.color) || board.in_stalemate?(current_player.color)
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
        board.check_valid_move(from_squ, to_squ)
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

  def print_win_message
    player = switch_players
    puts "Congratulations #{player.name}, you win!"
  end
 
  def print_tie_message
    puts "It's a stalemate!"
  end
