require 'capybara/rspec'
require 'cell'
require 'ship'
require 'board'

feature 'Board placing ships' do
  let(:cell) { Cell.new }
  let(:ship) { Ship.new 2 }
  let(:board) { Board.new 4, cell.class }

  # before(:each) do
  #
  # end

  scenario 'Board has a Cell in each square of its grid' do
    board.grid.each_value do |square|
      expect(square.class).to be cell.class
    end
  end

  # From here down I do not have unit tests supporting the feature tests
  # I'm assuming this is bad...
  # When you have a class like GameController that controls everything
  # Can you unit test it? You have to do SO much work with doubles and stubbing
  scenario 'Board can place a ship horizontally on grid' do
    board.place_ship_horizontally(ship, 'A1')
    expect(board.grid['A1'].content).to eq ship
    expect(board.grid['A2'].content).to eq ship
    expect(board.grid['A3'].content).not_to eq ship
  end

  scenario 'Error raised when ship placed horizontally out of bounds' do
    err_msg = 'Ship placed out of bounds'
    expect { board.place_ship_horizontally(ship, 'D4') }.to raise_error err_msg
  end

  scenario 'Board can place a ship vertically on grid' do
    board.place_ship_vertically(ship, 'A1')
    expect(board.grid['A1'].content).to eq ship
    expect(board.grid['B1'].content).to eq ship
    expect(board.grid['C1'].content).not_to eq ship
  end

  scenario 'Error raised when ship placed vertically out of bounds' do
    err_msg = 'Ship placed out of bounds'
    expect { board.place_ship_vertically(ship, 'D4') }.to raise_error err_msg
  end
end
