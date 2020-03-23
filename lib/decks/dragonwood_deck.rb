module Decks
  class DragonwoodDeck

    PRUNE_COUNT     = 12
    INITIAL_SIZE    = 30
    CARD_DATA_FILE  = "dragonwood_deck.yml"

    attr_reader :cards

    def initialize(cards_data = nil, prune: false)
      @cards = build_deck
      prune_cards if prune
    end

    def deal (num_cards)
      dealt = []
      while dealt.length < num_cards do
        card = cards.sample
        next if skip_card?(card)
        cards.delete(card)
        dealt << card
      end

      dealt
    end

    private

    def prune_cards
      deal(PRUNE_COUNT)
    end

    def skip_card? (card)
      ( dragon_card?(card) && skip_dragons? ) ||
      ( event_card?(card)  && skip_events?  )
    end

    def skip_dragons?
      cards.length > INITIAL_SIZE / 2
    end

    def skip_events?
      INITIAL_SIZE > cards.length &&
      cards.length > INITIAL_SIZE - 5
    end

    def dragon_card? (card)
      card.is_a?(Cards::CreatureCard) && card.is_dragon?
    end

    def event_card? (card)
      card.is_a?(Cards::EventCard)
    end

    def new_cards_data
      YAML
        .load(File.open("#{Rails.root}/config/#{CARD_DATA_FILE}"))
        .map(&:symbolize_keys)
    end

    def build_deck
      new_cards_data.each_with_object([]) do |card_data, cards|
        card_type = card_data.delete(:type)
        num_times(card_data).times { cards << card_class(card_type).new(**card_data) }
      end
    end

    def num_times (card_data)
      (card_data.delete(:qty) || 1)
    end

    def card_class (card_type)
      "Cards::#{card_type.to_s.capitalize}Card".constantize
    end
  end
end
