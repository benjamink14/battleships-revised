require 'capybara/rspec'
require 'cell'
require 'ship'

feature 'Ship in cell' do
  let(:cell) { Cell.new }
  let(:ship) { Ship.new }

  before(:each) do
    cell.fill(ship)
  end

  scenario 'can place ship in cell' do
    expect(cell.content).to eq ship
  end

  scenario 'ship is "hit" after hitting cell' do
    cell.hit
    expect(ship.hit_count).to eq 1
  end
end
