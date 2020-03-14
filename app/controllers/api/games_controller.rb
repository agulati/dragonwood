class Api::GamesController < ApplicationController
  respond_to :json

  def new
    respond_with Game.new
  end

  def create
    respond_with Game.create(game_params)
  end

  def show
    respond_with Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(
      :player_name
    )
  end
end
