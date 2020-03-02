class Api::V1::ForecastController < ApplicationController
  def index
      # response = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyCFSolOM7Xc7EMazBudkM4EjpVZJEg_zZ8")
      connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.params['key'] = ENV['google_api']
    end
    response = connection.get("?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA")
      binding.pry
  end
end
