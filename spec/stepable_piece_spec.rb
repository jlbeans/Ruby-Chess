# frozen_string_literal: true

require_relative '../lib/pieces'
require_relative '../lib/board'

describe Knight do
  let(:board) { Board.new }
  let(:knight) { Knight.new(board, :white, [0, 1]) }
  let(:knight_enemy) { Knight.new(board, :black, [2, 2]) }
  let(:knight_ally) { Pawn.new(board, :white, [1, 3]) }

  describe '#available_moves' do
    before do
      board[[0, 1]] = knight
      board[[2, 2]] = knight_enemy
    end

    it 'can move 2 steps vertically, 1 step horizontally' do
      result = knight.available_moves
      expect(result).to include [2, 0]
    end

    it 'can move 2 steps horizontally, 1 step vertically' do
      result = knight.available_moves
      expect(result).to include [1, 3]
    end

    it 'cannot move out of bounds' do
      result = knight.available_moves
      expect(result).not_to include [-2, 0]
    end

    it 'cannot take an ally' do
      board[[1, 3]] = knight_ally
      result = knight.available_moves
      expect(result).not_to include [1, 3]
    end

    it 'can take an enemy' do
      result = knight.available_moves
      expect(result).to include [2, 2]
    end
  end
end
