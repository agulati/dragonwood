class DiceRoller

  VALUES = [1, 2, 2, 3, 3, 4]

  attr_reader :dice

  def initialize(dice:)
    @dice = dice
  end

  def roll
    (1..dice).inject(0) { |sum,_| sum += VALUES.sample }
  end
end
