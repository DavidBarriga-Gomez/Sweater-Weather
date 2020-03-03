class GoogleService
  def initialize(location)
    @location = location
  end

  def connection
    conn = Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.params['key'] = ENV['google_api']
    end
  end

  def city
    response = connection.get("/maps/api/geocode/json?address=#{@location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:formatted_address]
  end

  def latitude_and_longitude
    response = connection.get("/maps/api/geocode/json?address=#{@location}")
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:geometry][:location].to_s
  end
end
