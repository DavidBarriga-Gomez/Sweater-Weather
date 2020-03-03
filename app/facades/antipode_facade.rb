class AntipodeFacade
  attr_reader :id, :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
    # @coordinates = coordinates.delete("lat=ong").sub('&', ',')
    # binding.pry
    @id = nil
  end

  def opposite_coordiantes
    AmypodeService.new(coordinates).opposite_coordiantes
  end

  def forecast_data
    DarkSkyService.new(opposite_coordiantes).forecast_data
    binding.pry
  end
end
