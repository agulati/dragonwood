class LadyBugCard < Card

  BONUS_CARD_COUNT = 2

  def self.all(deck:)
    [ LadyBugCard.new(deck: deck), LadyBugCard.new(deck: deck) ]
  end

  def handle
    remove_from_deck
    deck.draw_cards(count: BONUS_CARD_COUNT)
  end
end
