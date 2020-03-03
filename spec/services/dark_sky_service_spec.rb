require 'rails_helper'

RSpec.describe 'darksy api consumption' do
  it 'does the thing' do
    WebMock.disable!
    json_response = File.read('spec/fixtures/google_response.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['google_api']}").
    to_return(status: 200, body: json_response)

    string_coordinates = GoogleService.new('denver,co').latitude_and_longitude.delete("{a:lt=>ng}' ''")

    # json_response = File.read('spec/fixtures/dark_sky_response.json')
    # stub_request(:get, "https://api.darksky.net/forecast/#{ENV[dark_sky_api]}/39.7392358,-104.990251").
    # to_return(status: 200, body: json_response)

    service = DarkSkyService.new(string_coordinates)

    expect(service.forecast_data).to eq('')
    # expect(service.latitude_and_longitude).to eq("{:lat=>39.7392358, :lng=>-104.990251}")
    # checks that we can call methods on our service
  end
end
