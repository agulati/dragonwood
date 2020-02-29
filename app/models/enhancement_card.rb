class EnhancementCard < Card

  ENHANCEMENTS = [
    { enhancement: "Lucky Mushroom",    strike: 7,  stomp: 5,   scream: 7,  description: "Re-roll 1 die",                },
    { enhancement: "Ghost Disguise",    strike: 8,  stomp: 7,   scream: 10, description: "+2 scream",                    },
    { enhancement: "Silver Sword",      strike: 10, stomp: 6,   scream: 7,  description: "+2 strike",                    },
    { enhancement: "Bucket of Spinach", strike: 7,  stomp: 10,  scream: 8,  description: "+2 stomp",                     },
    { enhancement: "Cloak of Darkness", strike: 11, stomp: 9,   scream: 11, description: "+2 all captures",              },
    { enhancement: "Friendly Bunny",    strike: 4,  stomp: 4,   scream: 4,  description: "1x extra die",                 },
    { enhancement: "Magical Unicorn",   strike: 8,  stomp: 6,   scream: 8 , description: "+1 all captures",              },
    { enhancement: "Lighnting Bolt",    strike: 7,  stomp: 5,   scream: 7,  description: "1x +4 all captures",           },
    { enhancement: "Charmed Potion",    strike: 5,  stomp: 4,   scream: 5,  description: "1x act as any adventure card", },
  ].freeze

  attr_reader :enhancement, :strike, :stomp, :scream, :description

  class << self
    private

    def card_source
      ENHANCEMENTS
    end
  end

  def initialize(enhancement:, strike:, stomp:, scream:, description:, deck:)
    @enhancement  = enhancement
    @strike       = strike
    @stomp        = stomp
    @scream       = scream
    @description  = description
    @deck         = deck
  end
end
