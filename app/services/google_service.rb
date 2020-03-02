class GoogleService
  # attr_reader :connection
  def initialize(location)
    @location = location
  end

  def connection
    binding.pry
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?address=#{@location}") do |faraday|
      faraday.params['key'] = ENV['google_api']
    end
  end

  def city
    binding.pry
  end
end
