class Api::V1::AntipodeController < ApplicationController
  def index
    render json: AntipodeSerializer.new(AntipodeFacade.new(params[:coordinates]))
  end
end
