class LadyBugCard
  attr_reader :type

  def initialize
    @type = self.class.name
  end
end
