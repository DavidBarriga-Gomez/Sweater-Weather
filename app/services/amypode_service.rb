class AmypodeService
  def initialize(original_coordinates)
    @original_coordinates = original_coordinates
  end

  def connection
    conn = Faraday.new(url: "https://amypode.herokuapp.com") do |faraday|
      # faraday.headers["api_key"] = "amypode_api"
    end
    response = conn.get("/api/v1/antipodes?#{@original_coordinates}#{ENV["amypode_api"]}")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def opposite_coordinates
    connection[:data][:attributes].to_s.delete(":{}lat=>ong' ''")
  end
end
