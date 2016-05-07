class Game

  def initialize(player_one:,player_two:)
    @player_one = player_one
    @player_two = player_two
  end

  def winner
    return player_one if player_one.defeats?(player_two)
    return player_two if player_two.defeats?(player_one)
  end

  private

  attr_reader :player_one, :player_two

end
