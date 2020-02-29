class Player

  INITIAL_HAND_SIZE = 5

  attr_reader :name, :hand, :game

  def initialize(name:, adventurer_deck:, game:)
    @name = name
    @hand = new_hand(adventurer_deck)
    @game = game
  end

  private

  def new_hand(adventurer_deck)
    adventurer_deck.draw_cards(count: INITIAL_HAND_SIZE)
  end
end
