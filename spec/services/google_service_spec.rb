require 'rails_helper'

RSpec.describe 'google api consumption' do
  it 'does the thing' do
    # WebMock.disable!
    json_response = File.read('spec/fixtures/google_response.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['google_api']}").
        to_return(status: 200, body: json_response)

    service = GoogleService.new('denver,co')

    expect(service.city).to eq("Denver, CO, USA")
    expect(service.latitude_and_longitude).to eq("{:lat=>39.7392358, :lng=>-104.990251}")
  end
end
