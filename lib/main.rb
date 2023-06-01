# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'
require_relative 'pieces'

puts 'Player White, please enter your name:'
white_name = gets.chomp
p1 = Player.new(:white, white_name)

puts 'Player Black, please enter your name:'
black_name = gets.chomp
p2 = Player.new(:black, black_name)

b = Board.fill
game = Game.new(b, p1, p2)
game.play
