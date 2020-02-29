class Game
  attr_reader :adventurer_deck, :dragonwood_deck, :landscape, :player

  def initialize(player_name: "Player")
    @adventurer_deck  = AdventurerDeck.new(game: self)
    @dragonwood_deck  = DragonwoodDeck.new(game: self)
    @landscape        = Landscape.new(dragonwood_deck: dragonwood_deck, game: self)
    @player           = Player.new(name: player_name, adventurer_deck: adventurer_deck, game: self)
  end
end
