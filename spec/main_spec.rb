# frozen_string_literal: true

require './main'
require './board'
require './pieces/rook'
require './piece'
require './stepable'
require './pieces/pawn'

describe Board do
  subject(:board) { Board.new }
  describe 'when placing a piece on the board' do
    it 'receives coordinates that are in bounds' do
      expect(board.in_bounds?([0, 0])).to eq true
    end

    it 'receives coordinates that are out of bounds' do
      expect(board.in_bounds?([9, 0])).not_to eq true
    end

    it 'gets a piece at coordinates' do
      expect(board[[0, 0]]).to be_a Rook
    end
  end
end

describe Piece do 
end 
