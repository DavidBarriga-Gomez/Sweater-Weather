class AmypodeService
  def initialize(original_coordinates)
    @original_coordinates = original_coordinates
  end

  def connection
    conn = Faraday.new(url: "https://amypode.herokuapp.com") do |faraday|
      faraday.headers["api_key"] = "amypode_api"
    end
    response = conn.get("/api/v1/antipodes?#{@original_coordinates}")
    binding.pry
  end

  def opposite_coordiantes

  end
end
