require 'capybara/rspec'
require 'game'
require 'player'
require 'board'
require 'cell'

feature 'The game can be set up' do
  let(:board1) { Board.new 10, Cell }
  let(:board2) { Board.new 10, Cell }
  let(:game) { Game.new player_1, player_2 }
  let(:player_1) { Player.new board1 }
  let(:player_2) { Player.new board2 }

  it 'has two players when created' do
    expect(game.player_1).to eq player_1
    expect(game.player_2).to eq player_2
  end
end
