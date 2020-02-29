class Deck
  attr_reader :cards, :initial_size, :game

  def initialize(game:)
    initialize_deck

    @game         = game
    @initial_size = length
  end

  def draw_cards(count:)
    drawn = []
    count.times { drawn << draw }
    drawn.flatten
  end

  def length
    cards&.length || 0
  end

  private

  def card_types
    raise NotImplementedError
  end

  def initialize_deck
    @cards = card_types.map { |type| type.all(deck: self) }.flatten
  end

  def draw
    handle_card(cards.sample)
  end

  def handle_card(card)
    card.handle
  end
end
