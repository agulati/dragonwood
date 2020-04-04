class Game < ApplicationRecord
  serialize :adventurer_deck
  serialize :dragonwood_deck
  serialize :landscape
  serialize :user_hand

  belongs_to  :user

  before_create :setup_game

  validates :user, presence: true

  private

  def setup_game
    initialize_decks
    initialize_board
    initialize_hands
    default_to_not_complete
  end

  def default_to_not_complete
    self.completed = false if completed.nil?
  end

  def initialize_decks
    self.adventurer_deck = Decks::AdventurerDeck.new
    self.dragonwood_deck = Decks::DragonwoodDeck.new(prune: true)
  end

  def initialize_board
    self.landscape = Board::Landscape.new(deck: dragonwood_deck)
  end

  def initialize_hands
    self.user_hand = Hands::UserHand.new(deck: adventurer_deck)
  end
end
