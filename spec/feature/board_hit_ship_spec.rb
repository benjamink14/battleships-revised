require 'capybara/rspec'
require 'cell'
require 'ship'
require 'board'

feature 'Board hitting ships' do
  let(:cell) { Cell.new }
  let(:ship) { Ship.new 2 }
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
end
