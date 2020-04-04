class TurnTaker

  attr_reader :hand, :game

  def self.start_turn!(game:)
    new(game: game).start_turn
  end

  def self.discard_cards!(game:, cards:)
    new(game: game).discard(cards: cards)
  end

  def initialize(game:)
    @game = game
    @hand = game.user_hand
  end

  def start_turn
    hand.draw_card(deck: game.adventurer_deck)
    game.save!

    hand.discard_required?
  end

  def discard(cards:)
    cards.each { |card_data| hand.discard_card(card_data) }
  end
end
