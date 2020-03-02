class Api::V1::ForecastsController < ApplicationController
  def index
    response = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}") do |faraday|
      faraday.params['key'] = ENV['google_api']
  end
end
