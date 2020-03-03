class AntipodeFacade
  attr_reader :id, :coordinates

  def initialize(coordinates)
    @coordinates = coordinates
    @id = nil
  end

  def opposite_coordiantes
    AmypodeService.new(coordinates).opposite_coordiantes
  end

  def forecast_data
    DarkSkyService.new(coordinates).forecast_data
    binding.pry
  end
end
