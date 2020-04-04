class GameSerializer < ActiveModel::Serializer
  attributes :id, :landscape, :user_hand

  has_one :user
end
