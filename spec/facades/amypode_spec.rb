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

    expect(@facade.opposite_coordinates).to eq("-27.0,98.0")
    expect(@facade.wheater_summary).to eq('Overcast')
    expect(@facade.temperature).to eq(70.05)

    new_json = File.read('spec/fixtures/new_json.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyCFSolOM7Xc7EMazBudkM4EjpVZJEg_zZ8&latlng=-27.0,98.0").
    to_return(status: 200, body: new_json)
    
    expect(@facade.new_location(@facade.opposite_coordinates)).to eq('something')
    # expect(@facade.forecast_data).to eq('json file')
    # ^ checks that we can call methods on our returned facade
  end
end
