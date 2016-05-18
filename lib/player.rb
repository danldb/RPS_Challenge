# understand how to compare weapons with another player
class Player

  def initialize(name: 'RPS_Bot', weapon_class: Weapon)
    @name = name
    @weapon_class = weapon_class
  end

  def defeats?(challenger)
    weapon > challenger.weapon
  end

  def choose(weapon = nil)
    return @weapon = weapon_class.arm(weapon) if weapon
    @weapon = weapon_class.random
  end

  protected
  attr_reader :weapon_class, :weapon, :name
end
