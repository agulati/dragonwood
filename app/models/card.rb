class Card
  attr_reader :deck

  class << self
    def all(deck:)
      card_source.each_with_object([]) { |source, cards| add_card(deck, source, cards) }
    end

    private

    def card_source
      raise NotImplementedError
    end

    def add_card(deck, source, cards)
      cards << new(**source, deck: deck)
    end
  end

  def initialize(deck:)
    @deck = deck
  end

  def handle
    remove_from_deck
  end

  private

  def remove_from_deck
    deck.cards.delete(self)
  end
end
