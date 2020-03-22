class EventCard
  attr_reader :event, :description, :handler, :type

  def initialize(event:, description:, handler:)
    @type         = self.class.name
    @event        = event
    @description  = description
    @handler      = handler
  end
end
