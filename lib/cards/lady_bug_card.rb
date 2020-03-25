module Cards
  class LadyBugCard

    BONUS_CARD_COUNT = 2

    attr_reader :type

    def initialize
      @type = self.class.name
    end
  end
end
