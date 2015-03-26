require 'capybara/rspec'
require 'cell'
require 'ship'
require 'board'

feature 'Board hitting ships' do
  let(:cell) { Cell.new }
  let(:ship) { Ship.new }
  let(:board) { Board.new 4, cell.class }

  scenario 'Board can place a shot on a cell' do
    board.place_shot('A1')
    expect(board.grid['A1']).to be_hit
  end

  scenario 'Ship hit when cell is hit' do
    board.place_ship_horizontally ship, 'A1'
    board.place_shot('A1')
    expect(ship.hit_count).to eq(1)
  end

  scenario 'Error raised when placing shot on already hit cell' do
    board.place_shot('A1')
    expect { board.place_shot('A1') }.to raise_error 'Cell has already been hit'
  end

  scenario 'Error raised when placing shot out of bounds' do
    expect { board.place_shot('A9') }.to raise_error 'Shot placed out of bounds'
  end

  scenario 'Board sinks ship when hitting enough enough times' do
    board.place_ship_horizontally ship, 'A1'
    board.place_shot 'A1'
    board.place_shot 'A2'
    expect(board.grid['A1'].content).to be_sunk
    expect(board.grid['A2'].content).to be_sunk
  end

  scenario 'Board knows when all ships have been sunk' do
    board.place_ship_horizontally ship, 'A1'
    board.place_ship_horizontally Ship.new, 'B1'
    board.place_shot 'A1'
    board.place_shot 'A2'
    board.place_shot 'B1'
    board.place_shot 'B2'
    expect(board.all_ships_sunk).to eq true
  end
end
