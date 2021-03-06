class Api::V1::RoadTripsController < ApplicationController
  def index
    if User.find_by(api_key: params[:api_key])
      render json: RoadTripSerializer.new(RoadTripFacade.new(params[:origin], params[:destination]))
      # converts roadtrip facade to json else returns error below
    else
      render json: error_message, status: 400
    end
  end

  def error_message
    {errors:
    [{
      "status": 400,
      "detail": "Invalid API Key"
      }]}
  end
end
