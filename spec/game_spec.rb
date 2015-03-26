require 'game'

describe Game do
  let(:game) { Game.new player_1 }
  let(:player_1) { double :player_1 }
  let(:player_2) { double :player_2 }

  it 'has two players when created' do
    expect(game.player_1).to eq player_1
    expect(game.player_1).to eq player_2
  end
end
