# understand defeatable objects
class Game

  class << self

    def build
      @game = new
    end

    def current
      @game
    end
  end

  def add(player)
    return @player_two ||= player if @player_one
    @player_one ||= player
  end

  def winner
    return player_one if player_one.defeats?(player_two)
    player_two if player_two.defeats?(player_one)
  end

  def play(player_one_weapon: nil,player_two_weapon: nil)
    player_one.choose(player_one_weapon)
    player_two.choose(player_two_weapon)
  end

  private

  attr_reader :player_one, :player_two

end
