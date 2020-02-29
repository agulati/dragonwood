class EventCard < Card

  EVENTS = [
    {
      event: "Sunny Day",
      description: "All players draw 2",
      handler: :sunny_day,
    },
    {
      event: "Thunder Storm",
      description: "All palyers discard 1",
      handler: :thunder_storm,
    },
    {
      event: "Quicksand",
      description: "Replace all enhancements in Landscape",
      handler: :quicksand,
    },
    {
      event: "Wind Storm",
      description: "Pass 1 to the right",
      handler: :wind_storm,
    },
  ].freeze

  attr_reader :event, :description, :handler

  class << self
    private

    def card_source
      EVENTS
    end
  end

  def initialize(event:, description:, handler:, deck:)
    @event        = event
    @description  = description
    @handler      = handler
    @deck         = deck
  end

  def handle
    if can_draw?
      remove_from_deck(deck)
      send(handler)
    else
      deck.draw_cards(count: 1)
    end
  end

  private

  def can_draw?
    deck.initial_size && deck.length < (deck.initial_size - 5)
  end

  def sunny_day
  end

  def thunder_storm
  end

  def quicksand
  end

  def wind_storm
  end
end
