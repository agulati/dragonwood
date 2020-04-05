module Board
  class Landscape

    LANDSCAPE_SIZE = 5

    attr_reader :cards

    def initialize (deck: nil)
      @cards = deck.deal(LANDSCAPE_SIZE)
    end

    def card_present?(creature: nil, enhancement: nil)
      card_in_board(creature: creature, enhancement: enhancement).present?
    end

    def card_in_board(creature: nil, enhancement: nil)
      creature_card(creature) || enhancement_card(enhancement)
    end

    private

    def creature_card(creature)
      cards.detect { |c| c.is_a?(Cards::CreatureCard) && c.creature == creature }
    end

    def enhancement_card(enhancement)
      cards.detect { |c| c.is_a?(Cards::EnhancementCard) && c.enhancement == enhancement }
    end
  end
end
