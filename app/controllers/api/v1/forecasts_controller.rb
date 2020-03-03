class Api::V1::ForecastsController < ApplicationController
  def index
    render json: ForecastSerializer.new(ForecastFacade.new(params[:location]))
    # ForecastSerializer converts our string to json
    # ForecastFacade creates a poro based off the location
  end
end
