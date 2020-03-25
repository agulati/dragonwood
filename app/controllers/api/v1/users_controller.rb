class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]

  before_action :check_password, only: [:create]
  before_action :check_game_user, only: [:show]

  def create
    user = User.create!(user_params)
    command = AuthenticateUser.call(email, password)
    render json: new_user_response(user, command), status: :created
  end

  def show
    render json: game.user_hand
  end

  private

  def game
    @game ||= Game.find(params[:game_id])
  end

  def check_game_user
    raise Errors::GameNotFoundError unless game.user == current_user
  end

  def new_user_response(user, command)
    UserSerializer.new(user).as_json.merge({ auth_token: command.result })
  end

  def user_params
    params
      .require(:user)
      .permit(:name, :email, :password, :password_confirmation)
      .except(:password_confirmation)
  end

  def email
    params.dig(:user,:email)
  end

  def password
    params.dig(:user,:password)
  end

  def password_confirmation
    params.dig(:user,:password_confirmation)
  end

  def passwords_match?
     password.present? &&
     password_confirmation.present? &&
     password == password_confirmation
  end

  def check_password
    raise Errors::PasswordMismatchError.new unless passwords_match?
  end
end
