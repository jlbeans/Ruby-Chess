# frozen_string_literal: true

require_relative '../lib/pieces'
require_relative '../lib/board'

describe Pawn do
  let(:board) { Board.new }
  let(:pawn) { Pawn.new(board, :white, [1, 0]) }
  let(:pawn_ally) { Pawn.new(board, :white, [1, 6]) }
  let(:pawn_enemy) { Pawn.new(board, :black, [4, 0]) }

  describe '#available_moves' do
    it 'can move up 1' do
      board[[1, 0]] = pawn
      expect(pawn.available_moves).to include [2, 0]
    end

    it 'can move up 2 from starting position' do
      board[[1, 0]] = pawn
      expect(pawn.available_moves).to include [3, 0]
    end

    it 'cannot move up 2 from non-starting position' do
      board[[2, 0]] = pawn
      expect(pawn.available_moves).not_to include [4, 0]
    end

    it 'cannot move backwards' do
      board[[1, 0]] = pawn
      expect(pawn.available_moves).not_to include [0, 0]
    end

    it 'cannot move horizontally' do
      board[[1, 0]] = pawn
      expect(pawn.available_moves).not_to include [1, 1]
    end

    it 'can move diagonally to take an enemy' do
      board[[1, 0]] = pawn
      board[[2, 1]] = pawn_enemy
      expect(pawn.available_moves).to include [2, 1]
    end

    it 'cannot take an ally' do
      board[[1, 0]] = pawn
      board[[2, 1]] = pawn_ally
      expect(pawn.available_moves).not_to include [2, 1]
    end
  end
end
