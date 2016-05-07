class Player

  attr_reader :name

  def initialize(name:, weapon_class: Weapon)
    @name = name
    @weapon_class = weapon_class
  end

  def defeats?(challenger)
    weapon > challenger.weapon
  end

  def choose(weapon)
    @weapon = weapon_class.new(weapon)
  end

  protected
  attr_reader :weapon_class, :weapon
end

class Computer < Player

  def initialize(name: 'RPS_Bot', weapon_class: Weapon)
    super
  end

  def choose(weapon = nil)
    weapons = weapon_class.types
    @weapon = weapon || weapon_class.new(weapons.sample)
  end

end
