module Hands
  class UserHand

    INITIAL_SIZE = 5
    MAX_SIZE = 9

    attr_reader :cards

    def initialize(adventurer_deck:)
      @cards = adventurer_deck.deal(INITIAL_SIZE)
    end
  end
end
