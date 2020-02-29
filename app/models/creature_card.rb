class CreatureCard < Card

  CREATURES = [
    { qty: 4, creature: "Spooky Spider",    strike: 3,  stomp: 3,   scream: 4,  points: 1, },
    { qty: 4, creature: "Crazy Bat",        strike: 4,  stomp: 3,   scream: 3,  points: 1, },
    { qty: 2, creature: "Giggling Goblin",  strike: 7,  stomp: 5,   scream: 5,  points: 2, },
    { qty: 2, creature: "Fire Ants",        strike: 7,  stomp: 4,   scream: 6,  points: 2, },
    { qty: 2, creature: "Wasps' Nest",      strike: 5,  stomp: 6,   scream: 7,  points: 2, },
    { qty: 2, creature: "Hungry Bear",      strike: 7,  stomp: 6,   scream: 9,  points: 3, },
    { qty: 2, creature: "Pack of Wolves",   strike: 6,  stomp: 7,   scream: 9,  points: 3, },
    { qty: 2, creature: "Fierce Jaguar",    strike: 8,  stomp: 6,   scream: 8,  points: 3, },
    { qty: 2, creature: "Wild Boar",        strike: 8,  stomp: 7,   scream: 7,  points: 3, },
    { qty: 1, creature: "Grumpy Troll",     strike: 9,  stomp: 11,  scream: 9,  points: 4, },
    { qty: 1, creature: "Gigantic Python",  strike: 11, stomp: 8,   scream: 10, points: 4, },
    { qty: 1, creature: "Secret Shadow",    strike: 10, stomp: 8,   scream: 11, points: 4, },
    { qty: 1, creature: "Angry Ogre",       strike: 12, stomp: 9,   scream: 14, points: 5, },
    { qty: 1, creature: "Gooey Glob",       strike: 14, stomp: 9,   scream: 10, points: 5, },
    { qty: 1, creature: "Blue Dragon",      strike: 13, stomp: 10,  scream: 13, points: 6, },
    { qty: 1, creature: "Orange Dragon",    strike: 15, stomp: 11,  scream: 12, points: 7, },
  ].freeze

  attr_reader :strike, :stomp, :scream, :points, :creature

  class << self
    private

    def card_source
      CREATURES
    end

    def add_card(deck, creature, cards)
      creature[:qty].times { cards << new(**creature.except(:qty), deck: deck) }
    end
  end

  def initialize(creature:, points:, strike:, stomp:, scream:, deck:)
    @strike   = strike
    @stomp    = stomp
    @scream   = scream
    @points   = points
    @creature = creature
    @deck     = deck
  end

  def handle
    can_draw? ? remove_from_deck : deck.draw_cards(count: 1)
  end

  private

  def is_dragon?
    creature.include?("Dragon")
  end

  def can_draw?
    !is_dragon? || (deck.initial_size && deck.length < (deck.initial_size / 2))
  end
end
