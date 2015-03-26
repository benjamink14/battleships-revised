# Game
class Game
  attr_reader :player_1, :player_2, :turn

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @turn = @player_1
  end

  def turn_change
    @turn == @player1 ? @turn = @player_1 : @turn = @player_2
  end
end
