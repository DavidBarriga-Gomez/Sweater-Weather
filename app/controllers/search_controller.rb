class SearchController < ApplicationController
  def index
    connection = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.params['key'] = ENV['google_api']
    end
    response = connection.get("?address=denver,co")
    @denver_information = JSON.parse(response.body, symbolize_names: true)
  end
  #----------------------------------------------------------
end
