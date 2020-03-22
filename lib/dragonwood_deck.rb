class DragonwoodDeck

  CARD_DATA = {
    creature:     "creatures.yml",
    enhancement:  "enhancements.yml",
    event:        "events.yml",
  }

  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  private

  def build_deck
    CARD_DATA.each_with_object([]) do |(deck_type, data_file), cards|
      cards_data = load_data(data_file)
      cards_data.each_with_object(cards) do |card_data, cards|
        num_times(card_data).times { cards << card_class(deck_type).new(**card_data) }
      end
    end
  end

  def load_data(file_name)
    YAML
      .load(File.open("#{Rails.root}/config/#{file_name}"))
      .map(&:symbolize_keys)
  end

  def num_times(card_data)
    (card_data.delete(:qty) || 1)
  end

  def card_class(deck_type)
    "#{deck_type.to_s.capitalize}Card".constantize
  end
end
