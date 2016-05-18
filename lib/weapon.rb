# understand the relationship between types of weapons
class Weapon

  class << self
    def arm(type)
      const_get(type.upcase)
    end

    def random
      type = constants.sample
      arm(type)
    end
  end

  def initialize(type, beats) 
    @type = type
    @beats = beats
  end

  def >(challenger)
    beats == challenger.type
  end

  protected

  attr_reader :type, :beats

  ROCK     = new(:rock, :scissors)
  PAPER    = new(:paper, :rock)
  SCISSORS = new(:scissors, :paper)

  private_class_method :new

end
