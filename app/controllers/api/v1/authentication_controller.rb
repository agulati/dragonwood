class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  attr_reader :command

  def authenticate
    @command = AuthenticateUser.call(params[:email], params[:password])
    command.success? ? render_success : render_failure
  end

  private

  def render_success
    render json: { auth_token: command.result }
  end

  def render_failure
    render json: { message: command.errors }, status: :unauthorized
  end
end
