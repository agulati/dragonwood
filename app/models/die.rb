class Die

  SIDES = [1, 2, 2, 3, 3, 4]

  attr_reader :sides

  def initialize
    @sides = SIDES.dup
  end

  def roll
    sides.sample
  end
end
