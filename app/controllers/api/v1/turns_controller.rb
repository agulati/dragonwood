class Api::V1::TurnsController < ApplicationController
  before_action :check_game,  only: [:create]
  before_action :check_hand,  only: [:create]

  def create
    TurnTaker.start_turn!(game: game)
    render json: turn_response, status: :created
  end

  private

  def turn_response
    {
      code: code,
      hand: game.user_hand
    }
  end

  def code
    discard_required? ? Codes::DISCARD_REQUIRED : Codes::TIME_TO_ACT
  end
end
