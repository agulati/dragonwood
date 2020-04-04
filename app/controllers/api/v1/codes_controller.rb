class Api::V1::CodesController < ApplicationController
  skip_before_action :authenticate_request

  def index
    render json: { codes: Codes.all }
  end
end
