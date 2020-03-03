class DarkSkyService
  attr_reader :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
  end

  def connection
    conn = Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.params['key'] = ENV['dark_sky_api']
      faraday.params['exclude'] = 'minutely,flags'
    end
  end

  def forecast_data
    response = connection.get("/forecast/#{ENV['dark_sky_api']}/#{@coordinates}")
    json = JSON.parse(response.body, symbolize_names: true)
  end
end
