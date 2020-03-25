module Decks
  class AdventurerDeck

    LADY_BUG_CARD_COUNT = 4
    COLORS = ["green", "red", "purple", "blue", "orange"]
    VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

    attr_reader :cards

    def initialize
      @cards = adventurer_cards + lady_bug_cards
    end

    def deal (num_cards)
      dealt = []
      while dealt.length < num_cards do
        card = cards.sample
        if card.is_a?(Cards::LadyBugCard)
          dealt += deal(Cards::LadyBugCard::BONUS_CARD_COUNT)
          num_cards += 1
        else
          dealt << card
        end
        cards.delete(card)
      end

      dealt
    end

    private

    def adventurer_cards
      COLORS.each_with_object([]) do |color, cards|
        VALUES.each_with_object(cards) do |value, cards|
          cards << Cards::AdventurerCard.new(color: color, value: value)
        end
      end
    end

    def lady_bug_cards
      LADY_BUG_CARD_COUNT.times.each_with_object([]) do |_, cards|
        cards << Cards::LadyBugCard.new
      end
    end
  end
end
