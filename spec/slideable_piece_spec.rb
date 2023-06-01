# frozen_string_literal: true

require_relative '../lib/pieces'
require_relative '../lib/board'

describe Rook do
  let(:board) { Board.new }
  let(:rook) { Rook.new(board, :white, [0, 0]) }
  let(:rook_ally) { Rook.new(board, :white, [0, 7]) }
  let(:rook_enemy) { Rook.new(board, :black, [7, 0]) }

  describe '#available_moves' do
    before do
      board[[0, 0]] = rook
      board[[7, 0]] = rook_enemy
      board[[0, 7]] = rook_ally
    end

    it 'can move vertically' do
      result = rook.available_moves
      expect(result).to include [2, 0]
    end

    it 'can move horizontally' do
      result = rook.available_moves
      expect(result).to include [0, 2]
    end

    it 'cannot move diagonally' do
      result = rook.available_moves
      expect(result).not_to include [2, 2]
    end

    it 'cannot move out of bounds' do
      result = rook.available_moves
      expect(result).not_to include [-2, 0]
    end

    it 'cannot take an ally' do
      result = rook.available_moves
      expect(result).not_to include [0, 7]
    end

    it 'can take an enemy' do
      result = rook.available_moves
      expect(result).to include [7, 0]
    end
  end
end
