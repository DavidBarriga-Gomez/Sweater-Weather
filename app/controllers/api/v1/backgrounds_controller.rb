class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: BackgroundSerializer.new(BackgroundFacade.new(params[:location]))
    # converts bacground facade to json
  end
end
