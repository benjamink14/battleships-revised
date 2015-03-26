require 'capybara/rspec'
require 'cell'
require 'ship'
require 'board'

feature 'Player setting up' do
  let(:board) { Board.new 10, Cell }
  let(:player) { Player.new board }
  scenario 'Player starts with a board' do
    expect(player.board).not_to be nil
  end

  xscenario 'Player can be given a set of ships'
end
