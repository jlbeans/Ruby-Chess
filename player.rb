# frozen_string_literal: true

class Player
  attr_reader :name, :color

  def initialize(color)
    @color = color
    @name = user_input
  end

  def user_input
    puts "Player #{color}, please enter your name:"
    gets.chomp
  end
end
