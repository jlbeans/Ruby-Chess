# frozen_string_literal: true

# create players
class Player
  attr_reader :color, :name

  def initialize(color, name)
    @color = color
    @name = name
  end
end
