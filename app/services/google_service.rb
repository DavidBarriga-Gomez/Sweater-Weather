class GoogleService
  attr_reader :city, :latitude_and_longitude
  # allows us to call ^ methods outside of scope
  def initialize(location)
    @location = location
  end
  # ^ instantiated with

  def connection
    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params['key'] = ENV['google_api']
    end
  end
  # initial connection to our url

  def city
    response = connection.get("/maps/api/geocode/json?address=#{@location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:formatted_address]
  end
  # gets our connection adds our parameter and converts to json, then returns the last line

  def latitude_and_longitude
    response = connection.get("/maps/api/geocode/json?address=#{@location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:geometry][:location].to_s
  end
end
