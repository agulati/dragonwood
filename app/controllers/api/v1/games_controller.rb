class Api::V1::GamesController < ApplicationController
  before_action :check_for_game, only: [:show]

  def create
    render json: Game.create!(user: current_user), status: :created
  end

  def show
    render json: game, status: :ok
  end

  private

  def check_for_game
    raise Errors::GameNotFoundError.new if game.nil?
  end

  def game
    @game ||= Game.find_by(id: params[:id], user: current_user)
  end
end
