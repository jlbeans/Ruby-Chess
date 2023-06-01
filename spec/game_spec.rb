# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/errors/invalid_piece'
require_relative '../lib/errors/invalid_input'

describe Game do 
    subject(:game) {described_class.new(board, player1, player2)}
    let(:board) {Board.fill}
    let(:player1) {Player.new(:white, 'bob')}
    let(:player2) {Player.new(:black, 'sam')}

    describe '#validate_input' do 
        context 'when player input is valid' do 
            it 'does not raise an error' do 
                expect {game.validate_input('1A')}.not_to raise_error
            end 
            it 'does not raise an error' do 
                expect {game.validate_input('1a')}.not_to raise_error
            end 
        end 

        context 'when player input is not valid' do 
            it 'raises an error' do 
                expect {game.validate_input('1Z')}.to raise_error(InvalidInputError)
            end 
            it 'raises an error' do 
                expect {game.validate_input('11')}.to raise_error(InvalidInputError)
            end 
        end
    end 

    describe '#input_to_coordinates' do 
        it 'translates coordinates input to position on the board' do 
            result = game.input_to_coordinates('1A')
            expect(result).to eq [0, 0]
        end 
    end 

    describe '#validate_piece' do 
        context 'when player selects a piece to move' do 
            it 'does not raise an error' do 
                position = [1, 0]
                expect {game.validate_piece(position)}.not_to raise_error
            end 
        end 

        context 'when player selects a an empty square to move' do 
            it 'raises an error' do 
                position = [3, 0]
                expect {game.validate_piece(position)}.to raise_error(InvalidPieceError)
            end 
        end 
    end 
end 
