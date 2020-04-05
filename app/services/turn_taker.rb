class TurnTaker

  attr_reader :hand, :game, :cards, :action, :target, :weapon

  class << self
    def start_turn!(game:)
      new(game: game).start_turn
    end

    def discard_cards!(game:, cards:)
      new(game: game, cards: cards).discard
    end

    def take_action!(game:, action:, cards: nil, target: nil, weapon: nil)
      new(
        game: game,
        action: action,
        cards: cards,
        target: target,
        weapon: weapon
      ).take_action
    end
  end

  def initialize(game:, action: nil, cards: nil, target: nil, weapon: nil)
    @game   = game
    @hand   = game.user_hand
    @cards  = cards
    @action = action&.to_sym
    @target = target
    @weapon = weapon
  end

  def start_turn
    hand.draw_card(deck: game.adventurer_deck)
    game.save!
  end

  def discard
    cards.each { |card_data| hand.discard_card(card_data) }
    game.save!
  end

  def take_action
    public_send(action)
    game.save!
  end

  def reload
    hand.draw_card(deck: game.adventurer_deck)
  end

  def capture
    validate_cards_in_hand

    CardCapturer.capture_target(
      game:   game,
      cards:  cards,
      target: target,
      weapon: weapon
    )
  end

  private

  def validate_cards_in_hand
    cards.each { |card| raise Errors::CardNotInHandError.new(**card) if hand.card_in_hand(card).nil? }
  end
end
