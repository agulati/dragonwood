class CardCapturer

  attr_reader :game, :cards, :target, :weapon

  class << self
    def capture_target(game:, cards:, target:, weapon:)
      new(game: game, cards: cards, target: target, weapon: weapon).capture
    end
  end

  def initialize(game:, cards:, target:, weapon:)
    @game   = game
    @cards  = cards
    @target = target
    @weapon = weapon
  end

  def capture
    validate_weapon
    validate_target

    dice_roll = DiceRoller.new(dice: cards.length).roll
    # add enhancements
    target_value = game.landscape.card_in_board(**target)&.send(weapon)
    if dice_roll >= target_value
      captured = game.landscape.cards.delete(game.landscape.card_in_board(**target))
      game.user_hand.send("#{target.keys.first.to_s}s".to_sym) << captured
      cards.each do |card|
        game.user_hand.discard(card)
      end
      game.landscape.cards << game.dragonwood_deck.deal(1)
      # handle event card
    else
      # discard penalty card
    end
  end

  private

  def validate_weapon
    raise Errors::InvalidStomp.new  if stomp_attack?  && !valid_stomp?
    raise Errors::InvalidStrike.new if strike_attack? && !valid_strike?
    raise Errors::InvalidScream.new if scream_attack? && !valid_scream?
  end

  def validate_target
    raise Errors::CardNotOnBoard.new(card_type: target.keys.first.to_s.titleize, card_name: target.values.first.titleize) unless game.landscape.card_present?(**target)
  end

  def stomp_attack?
    weapon == "stomp"
  end

  def strike_attack?
    weapon == "strike"
  end

  def scream_attack?
    weapon == "scream"
  end

  def valid_stomp?
    cards.all? { |c| c[:value] == cards.first[:value] }
  end

  def valid_strike?
    sorted = cards.sort_by { |c| c[:value] }
    in_sequence = true
    i = 1
    while in_sequence && i < cards.length do
      in_sequence = cards[i][:value] == cards[i-1][:value] + 1
      i += 1
    end

    in_sequence
  end

  def valid_scream?
    cards.all? { |c| c[:color] == cards.first[:color] }
  end
end
