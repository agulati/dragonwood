module Hands
  class UserHand

    INITIAL_SIZE = 5
    MAX_SIZE = 9

    attr_accessor :cards

    def initialize(deck:)
      self.cards = deck.deal(INITIAL_SIZE)
    end

    def draw_card(deck:)
      self.cards += deck.deal(1)
    end

    def length
      self.cards.length
    end

    def discard_required?
      length > MAX_SIZE
    end

    def discard_card(card_data)
      card = card_in_hand(card_data)
      cards.delete(card) if card
    end

    def card_in_hand(card_data)
      cards.detect do |card|
        card.is_a?(Cards::AdventurerCard) &&
        card.color == card_data[:color] &&
        card.value == card_data[:value].to_i
      end
    end
  end
end
