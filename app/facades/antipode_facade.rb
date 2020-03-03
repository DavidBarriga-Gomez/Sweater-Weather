class AntipodeFacade
  attr_reader :id, :coordinates
  def initialize(coordinates)
    @coordinates = coordinates
    @id = nil
  end
end
