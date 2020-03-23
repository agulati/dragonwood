module Board
  class Landscape

    LANDSCAPE_SIZE = 5

    attr_reader :cards

    def initialize (dragonwood_deck: nil)
      @cards = dragonwood_deck.deal(LANDSCAPE_SIZE)
    end
  end
end
