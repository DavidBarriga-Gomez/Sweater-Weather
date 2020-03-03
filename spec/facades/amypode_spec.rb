require 'rails_helper'

RSpec.describe 'amypode facade' do
  it 'returns opposite langitude / longitude' do
    # WebMock.disable!
    amypode_response = File.read('spec/fixtures/amypode_response.json')
    stub_request(:get, "https://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82#{ENV["amypode_api"]}").
    to_return(status: 200, body: amypode_response)
        # stubs out the json response

    @facade = AntipodeFacade.new("lat=27&long=-82")
    # creates a facade / object / poro

    expect(@facade.opposite_coordiantes).to eq("-27.0,98.0")
    expect(@facade.forecast_data).to eq('som')
    # ^ checks that we can call methods on our returned facade
  end
end
