class Landscape

  LANDSCAPE_SIZE = 5

  attr_reader :cards, :game

  def initialize(dragonwood_deck:, game:)
    @cards  = dragonwood_deck.draw_cards(count: LANDSCAPE_SIZE)
    @game   = game
  end
end
