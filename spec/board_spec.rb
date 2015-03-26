require 'board'

describe Board do
  let(:ship) { double :ship, size: 3 }
  let(:cell) { double :cell }
  let(:board) { Board.new cell }

  before(:each) do
    allow(cell).to receive(:new).and_return(cell)
  end

  it 'is created with a default capacity of 2x1' do
    expect(board.dimensions).to eq '2x2'
    expect(board.grid.size).to eq 4
  end

  it 'can be created with a custom capacity' do
    board = Board.new 4, cell
    expect(board.dimensions).to eq '4x4'
    expect(board.grid.size).to eq 16
  end

  it 'has a Cell in each square of its grid' do
    board.grid.each_value do |square|
      expect(square).to eq cell
    end
  end

  # D:
  # Ideally ship is also tested not to be in any other squares
  it 'can place a ship on its grid horizontally' do
    board.place_ship_horizontally ship, 'A1'
    expect(board.grid['A3'].content).to eq ship
  end

  xit 'cannot place ships out of bounds'

  xit 'raise error when placing ship twice'

  xit 'raise error when overlap'
end
