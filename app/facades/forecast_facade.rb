class ForecastFacade
  attr_reader :id, :location
  # allows us to call above methods outside of this scope
  def initialize(location)
    @location = location
    @id = nil
  end
  # how a facade is instantiated

  # def id
  # end

  def city
    GoogleService.new(location).city
  end
  # allows you to call city on facade

  def latitude_and_longitude
    GoogleService.new(location).latitude_and_longitude
  end
  # allows you to call ^ method on facade
end
