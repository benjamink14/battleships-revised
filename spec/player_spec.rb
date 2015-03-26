require 'player'

describe Player do
  let(:board) { double :board }
  let(:player) { Player.new board }

  it 'is set up with a board' do
    expect(player.board).not_to be nil
  end
end
