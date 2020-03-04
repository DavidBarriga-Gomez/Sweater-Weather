class BackgroundFacade
  attr_reader :id, :location

  def initialize(location)
    @location = location
  end

  def image_address
    unsplash_service.image_address
  end

  def unsplash_service
    @unsplash_service ||= UnsplashService.new(location)
  end
end
