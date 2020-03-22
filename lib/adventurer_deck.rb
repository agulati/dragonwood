class AdventurerDeck

  LADY_BUG_CARD_COUNT = 4
  COLORS = ["green", "red", "purple", "blue", "orange"]
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  attr_reader :cards

  def initialize
    @cards = adventurer_cards + lady_bug_cards
  end

  private

  def adventurer_cards
    COLORS.each_with_object([]) do |color, cards|
      VALUES.each_with_object(cards) do |value, cards|
        cards << AdventurerCard.new(color: color, value: value)
      end
    end
  end

  def lady_bug_cards
    LADY_BUG_CARD_COUNT.times.each_with_object([]) do |_, cards|
      cards << LadyBugCard.new
    end
  end
end
