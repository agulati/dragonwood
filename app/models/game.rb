class Game < ApplicationRecord
  belongs_to  :user
  has_many    :game_states

  before_create :default_to_not_complete
  after_create :initialize_state

  validates :user, presence: true

  def current_state
    game_states.last
  end

  private

  def default_to_not_complete
    self.completed = false if completed.nil?
  end

  def initialize_state
    self.game_states << GameState.create!(game: self)
  end
end
