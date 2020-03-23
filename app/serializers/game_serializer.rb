class GameSerializer < ActiveModel::Serializer
  attributes :id, :board

  has_one :user

  def board
    GameStateSerializer.new(object.current_state)
  end
end
