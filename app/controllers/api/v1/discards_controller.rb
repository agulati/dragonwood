class Api::V1::DiscardsController < ApplicationController
  before_action :check_game,  only: [:create]

  def create
    TurnTaker.discard_cards!(game: game, cards: cards)
    render json: discard_response, status: :created
  end

  private

  def cards
    params.require(:cards)
  end

  def discard_response
    {
      code: code,
      hand: game.user_hand
    }
  end

  def code
    discard_required? ? Codes::DISCARD_REQUIRED : Codes::TIME_TO_ACT
  end
end
