class GameState < ApplicationRecord
  serialize :adventurer_deck, JSON
  serialize :dragonwood_deck, JSON
  serialize :landscape_deck,  JSON
  serialize :user_hand,       JSON
  serialize :bot_hand,        JSON

  belongs_to :game

  before_create :initialize_decks_and_hands

  private

  def initialize_decks_and_hands
    self.adventurer_deck = AdventurerDeck.new
    self.dragonwood_deck = DragonwoodDeck.new
    self.landscape_deck = {}
    self.user_hand = {}
    self.bot_hand = {}
  end
end
