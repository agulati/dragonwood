class AdventurerCard < Card

  COLORS = ["GREEN", "RED", "PURPLE", "BLUE", "ORANGE"]
  VALUES = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  attr_reader :color, :value, :deck

  class << self
    private

    def card_source
      COLORS
    end

    def add_card(deck, color, cards)
      VALUES.each_with_object(cards) { |value, cards| cards << new(color: color, value: value, deck: deck) }
    end
  end

  def initialize(color:, value:, deck:)
    @color  = color
    @value  = value
    @deck   = deck
  end
end
