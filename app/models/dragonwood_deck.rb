class DragonwoodDeck < Deck

  PRUNE_COUNT = 12

  private

  def initialize_deck
    @cards = super
    prune_cards
  end

  def prune_cards
    draw_cards(count: PRUNE_COUNT)
  end

  def card_types
    [ CreatureCard, EventCard, EnhancementCard ]
  end
end
