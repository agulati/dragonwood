class EnhancementCard
  attr_reader :enhancement, :strike, :stomp, :scream, :description, :type

  def initialize(enhancement:, strike:, stomp:, scream:, description:)
    @type         = self.class.name
    @enhancement  = enhancement
    @strike       = strike
    @stomp        = stomp
    @scream       = scream
    @description  = description
  end
end
