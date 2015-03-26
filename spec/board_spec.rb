require 'board'

describe Board do
  let(:ship) { double :ship, length: 2 }
  let(:cell) { double :cell }
  let(:board) { Board.new cell }

  before(:each) do
    allow(cell).to receive(:new).and_return(cell)
    allow(cell).to receive(:fill)
    allow(cell).to receive(:content).and_return(ship)
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

  # What's the point of this test? Would work without line 36
  it 'can place a ship on its grid horizontally' do
    board.place_ship_horizontally ship, 'A1'
    expect(board.grid['A2'].content).to eq ship
  end

  it 'can place a ship on its grid vertically' do
    board.place_ship_vertically ship, 'A1'
    expect(board.grid['B2'].content).to eq ship
  end

  it 'cannot place ships out of bounds' do
    err_msg = 'Ship placed out of bounds'
    expect { board.place_ship_horizontally ship, 'B2' }.to raise_error err_msg
    expect { board.place_ship_vertically ship, 'C2' }.to raise_error err_msg
  end

  it 'raise error when placing ship twice' do
    err_msg = 'Ship already placed'
    board.place_ship_horizontally ship, 'A1'
    expect { board.place_ship_horizontally ship, 'B1' }.to raise_error err_msg
  end

  xit 'raise error when overlap'
end
