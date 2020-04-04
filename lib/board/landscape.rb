module Board
  class Landscape

    LANDSCAPE_SIZE = 5

    attr_reader :cards

    def initialize (deck: nil)
      @cards = deck.deal(LANDSCAPE_SIZE)
    end
  end
end
