class Weapon

  ROCK     = ->(challenger){ [:scissors].include?(challenger) }
  PAPER    = ->(challenger){ [:rock].include?(challenger)     }
  SCISSORS = ->(challenger){ [:paper].include?(challenger)    }

  def initialize(type) 
    @type = type
  end

  def self.types
    constants.map(&:downcase)
  end

  def >(challenger)
    self.class.const_get(type.upcase).call(challenger.type)
  end

  protected

  attr_reader :type
end
