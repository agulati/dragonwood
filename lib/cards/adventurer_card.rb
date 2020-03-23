module Cards
  class AdventurerCard

    attr_reader :color, :value, :type

    def initialize (color:, value:)
      @type   = self.class.name
      @color  = color
      @value  = value
    end
  end
end
