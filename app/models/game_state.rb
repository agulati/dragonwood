class GameState < ApplicationRecord
  serialize :adventurer_deck
  serialize :dragonwood_deck
  serialize :landscape
  serialize :user_hand
  serialize :bot_hand

  belongs_to :game

  before_create :initialize_state

  private

  def initialize_decks
    self.adventurer_deck = Decks::AdventurerDeck.new
    self.dragonwood_deck = Decks::DragonwoodDeck.new(prune: true)
  end

  def initialize_board
    self.landscape = Board::Landscape.new(dragonwood_deck: dragonwood_deck)
  end

  def initialize_hands
    self.user_hand = Hands::UserHand.new
    self.bot_hand  = Hands::BotHand.new
  end

  def initialize_state
    initialize_decks
    initialize_board
    initialize_hands
  end
end
