class ApplicationController < ActionController::API
  rescue_from Errors::DragonwoodError,      with: :render_error
  rescue_from ActiveRecord::RecordInvalid,  with: :render_validation_error
  # rescue_from StandardError,                with: :render_error

  before_action :authenticate_request

  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    raise Errors::AuthenticationFailedError.new unless @current_user
  end

  def render_error (exception)
    Rails.logger.error("*** #{exception.class} *** #{exception.message}")
    Rails.logger.error(Kernel.caller_locations.join("\n"))
    render json: exception, status: exception.try(:http_status) || 500
  end

  def render_validation_error (exception)
    render_error(Errors::ValidationError.new(exception))
  end

  def game
    @game ||= Game.find_by(id: game_id, user: current_user)
  end

  def game_id
    params[:game_id]
  end

  def check_game
    raise Errors::GameNotFoundError.new if game.nil?
  end

  def check_hand
    raise Errors::HandTooLargeError.new(max_cards: Hands::UserHand::MAX_SIZE) if discard_required?
  end

  def discard_required?
    !!game&.user_hand&.discard_required?
  end
end
