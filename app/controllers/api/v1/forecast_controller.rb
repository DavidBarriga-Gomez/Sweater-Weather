class Api::V1::ForecastController < ApplicationController
  def index
    conn = Faraday.get(url: "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co+CA&key=AIzaSyBp0wYB9jCN3id6w635BT_FkB0NjuHjygc")
      # faraday.headers['key'] = ENV['google_api']
      binding.pry
    # end
  end
end
