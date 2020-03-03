require 'rails_helper'

RSpec.describe 'amypode facade' do
  it 'returns opposite langitude / longitude' do
    # WebMock.disable!
    amypode_response = File.read('spec/fixtures/amypode_response.json')
    stub_request(:get, "https://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82#{ENV["amypode_api"]}").
    to_return(status: 200, body: amypode_response)

    amypode_dsresponse = File.read('spec/fixtures/amypode_dsresponse.json')
    stub_request(:get, "https://api.darksky.net/forecast/d81989bf45ddc0ad76ecfa8b1e8856e3/-27.0,98.0?exclude=minutely,flags&key=d81989bf45ddc0ad76ecfa8b1e8856e3").
    to_return(status: 200, body: amypode_dsresponse)
        # stubs out the json response

    @facade = AntipodeFacade.new("lat=27&long=-82")
    # creates a facade / object / poro

    expect(@facade.opposite_coordiantes).to eq("-27.0,98.0")
    expect(@facade.forecast_data).to eq('json file')
    # ^ checks that we can call methods on our returned facade
  end
end
