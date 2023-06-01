# frozen_string_literal: true

require_relative '../lib/board'
require_relative'../lib/errors/invalid_move'

describe Board do
  describe 'initial board set up' do
    subject(:board) { described_class.fill }
    it 'has empty spaces' do
      expect(board.empty?([3, 0])).to eq true
    end

    it 'has coordinates that are in bounds' do
      expect(board.in_bounds?([0, 0])).to eq true
    end

    it 'has coordinates that are out of bounds' do
      expect(board.in_bounds?([9, 0])).not_to eq true
    end

    it 'has first 2 rows of white pieces' do
      expect(board.grid[0].all? { |piece| piece.color == :white}).to be true
      expect(board.grid[1].all? { |piece| piece.color == :white}).to be true
    end
    
    it 'has last 2 rows of black pieces' do 
      expect(board.grid[6].all? { |piece| piece.color == :black}).to be true
      expect(board.grid[7].all? { |piece| piece.color == :black}).to be true
    end 
  end

  describe '#move_piece' do 
    subject(:board) { described_class.fill }
    it 'moves a piece on the board' do 
      board.move_piece([1, 0], [3, 0])
      expect(board[[1, 0]]).to eq nil
      expect(board[[3, 0]]).to be_a Pawn
    end 
  end 

  describe '#in_check?' do 
    subject(:board) { described_class.new }
    context 'when a king is in check' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
        board[[1, 4]] = Queen.new(board, :white, [1, 4])
      end 

      it 'returns true' do 
        expect(board.in_check?(:black)).to be true 
      end 
    end 

    context 'when a king is not in check' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
        board[[1, 5]] = Queen.new(board, :white, [1, 5])
      end 

      it 'returns false' do 
        expect(board.in_check?(:black)).to be false
      end 
    end 
  end 

  describe '#in_check_mate?' do 
    subject(:board) { described_class.new }
    context 'when a king is in check mate' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
        board[[6, 5]] = Queen.new(board, :white, [6, 5])
        board[[6, 3]] = Rook.new(board, :white, [6, 3])
      end 

      it 'returns true' do 
        expect(board.in_check_mate?(:black)).to be true 
      end 
    end 

    context 'when a king is not in check mate' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
        board[[6, 5]] = Queen.new(board, :white, [6, 5])
      end 

      it 'returns false' do 
        expect(board.in_check_mate?(:black)).to be false
      end 
    end 
  end 

  describe '#in_stalemate?' do 
    subject(:board) { described_class.new }
    context 'when a king is in stalemate' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
        board[[6, 5]] = Queen.new(board, :white, [6, 6])
        board[[6, 3]] = Rook.new(board, :white, [6, 3])
      end 

      it 'returns true' do 
        expect(board.in_stalemate?(:black)).to be true 
      end 
    end 

    context 'when a king is not in stalemate' do 
      before do 
        board[[7, 4]] = King.new(board, :black, [7, 4])
      end 

      it 'returns false' do 
        expect(board.in_stalemate?(:black)).to be false
      end 
    end 
  end 

  describe '#check_valid_move' do
    subject(:board) { described_class.new }

    before do 
      board[[1, 4]] = Queen.new(board, :white, [1, 4])
      board[[0, 4]] = King.new(board, :white, [0, 4])
      board[[7, 3]] = Queen.new(board, :black, [7, 3])
      board[[7, 4]] = King.new(board, :black, [7, 4])
    end 

    context 'when move coordinates match a valid move' do 
      it 'moves piece on the board' do 
        board.check_valid_move([7, 3], [6, 4])
        expect(board[[7, 3]]).to eq nil
        expect(board[[6, 4]]).to be_a Queen
      end 
    end 

    context 'when move coordinates do not match a valid move' do
      it 'raises an error' do
       expect { board.check_valid_move([7, 3], [6, 3]) }.to raise_error(InvalidMoveError)
      end
    end 
  end
end
