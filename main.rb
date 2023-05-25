# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

puts 'Player White, please enter your name:'
white = gets.chomp
p1 = Player.new(:white, white)

puts 'Player Black, please enter your name:'
black = gets.chomp
p2 = Player.new(:black, black)

b = Board.fill
game = Game.new(b, p1, p2)
game.play
