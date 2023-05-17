require './main'

describe Board do
    describe "when placing a piece on the board" do 
        before {@b = Board.new}
        
        it 'receives coordinates that are in bounds' do
            expect(@b.in_bounds?([0, 0])).to eq true
        end

        it 'receives coordinates that are out of bounds' do 
            expect(@b.in_bounds?([9, 0])).not_to eq true
        end 
    end
end