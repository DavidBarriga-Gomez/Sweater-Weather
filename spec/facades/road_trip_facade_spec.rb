require 'rails_helper'

describe 'road trip facade' do
  it 'returns road trip facade data' do

    route_response = File.read('spec/fixtures/dallas_denver_route_data.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/directions/json?destination=denver,co&key=#{ENV['GOOGLE_KEY']}&origin=dallas,tx").
      to_return(status: 200, body: route_response)

    darksky_response = File.read('spec/fixtures/denver_darksky_data.json')
    stub_request(:get, "https://api.darksky.net/forecast/#{ENV['DARKSKY_KEY']}/39.7411598,-104.9879112?exclude=minutely,flags").
      to_return(status: 200, body: darksky_response)
      @facade = RoadTripFacade.new('dallas,tx', 'denver,co')

    expect(@facade.origin).to eq("Dallas, TX, USA")

    expect(@facade.destination).to eq("Denver, CO, USA")

    expect(@facade.travel_time).to eq("12 hours 3 mins")

    expect(@facade.arrival_forecast[:temperature]).to eq(43)
    expect(@facade.arrival_forecast[:summary]).to eq("Clear")
  end
end
