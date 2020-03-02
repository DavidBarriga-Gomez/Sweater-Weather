class GoogleService
  def initialize(location)
    @location = location
  end

  def connection
    Faraday.new(url: 'https://maps.googleapis.com/maps/api/geocode/json?address=denver+co+CA&key=AIzaSyBp0wYB9jCN3id6w635BT_FkB0NjuHjygc') do |faraday|
      faraday.params['key'] = ENV['google_api']
      binding.pry
    end
  end
end
