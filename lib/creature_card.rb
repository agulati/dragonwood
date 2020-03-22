class CreatureCard
  attr_reader :strike, :stomp, :scream, :points, :creature, :type

  def initialize(creature:, points:, strike:, stomp:, scream:)
    @type     = self.class.name
    @strike   = strike
    @stomp    = stomp
    @scream   = scream
    @points   = points
    @creature = creature
  end
end
