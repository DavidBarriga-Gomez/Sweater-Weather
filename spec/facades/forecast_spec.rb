require 'rails_helper'

RSpec.describe 'forecast facade' do
  it 'returns city and langitude / longitude' do
    # WebMock.disable!
    json_response = File.read('spec/fixtures/google_response.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['google_api']}").
        to_return(status: 200, body: json_response)
        # stubs out the json response

    @facade = ForecastFacade.new('denver,co')
    # creates a facade / object / poro

    expect(@facade.city).to eq("Denver, CO, USA")
    expect(@facade.latitude_and_longitude).to eq("{:lat=>39.7392358, :lng=>-104.990251}")
    # ^ checks that we can call methods on our returned facade
  end
end
