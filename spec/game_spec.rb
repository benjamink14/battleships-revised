require 'game'

describe Game do
  let(:game) { Game.new player_1 }
  let(:player_1) { double :player_1 }

  it 'has a player' do
    expect(game.player_1).to eq player_1
  end
end
