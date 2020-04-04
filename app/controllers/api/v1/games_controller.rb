class Api::V1::GamesController < ApplicationController
  before_action :check_game, only: [:show]

  def create
    render json: Game.create!(user: current_user), status: :created
  end

  def show
    render json: game, status: :ok
  end

  private

  def game_id
    params[:id]
  end
end
