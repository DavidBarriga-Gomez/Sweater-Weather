class AntipodeFacade
  attr_reader :id, :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
    # @coordinates = coordinates.delete("lat=ong").sub('&', ',')
    # binding.pry
    @id = nil
  end

  def opposite_coordinates
    AmypodeService.new(coordinates).opposite_coordinates
  end

  def forecast_data
    DarkSkyService.new(opposite_coordinates).forecast_data
  end

  def wheater_summary
    forecast_data[:currently][:summary]
  end

  def temperature
    forecast_data[:currently][:temperature]
  end
end
