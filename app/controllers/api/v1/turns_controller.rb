class Api::V1::TurnsController < ApplicationController
  before_action :check_game,  only: [:create, :update]
  before_action :check_hand,  only: [:create, :update]

  def create
    TurnTaker.start_turn!(game: game)
    render json: turn_response, status: :created
  end

  def update
    TurnTaker.take_action!(**update_turn_params)
    render json: turn_response, status: :ok
  end

  private

  def update_turn_params
    params
      .require(:turn)
      .permit(:action, :weapon, target: {}, cards: [:color, :value])
      .to_h
      .deep_symbolize_keys
      .merge(game: game)
  end

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
