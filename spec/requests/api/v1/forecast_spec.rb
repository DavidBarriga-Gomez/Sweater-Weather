require 'rails_helper'

RSpec.describe 'gives data' do
  it 'uses structure to return data' do
    # WebMock.disable!
    json_response = File.read('spec/fixtures/google_response.json')
    stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=#{ENV['google_api']}").
        to_return(status: 200, body: json_response)
        # ^ stubs the get request to a url into json


    get "/api/v1/forecast?location=denver,co"
    # get request to our endpoint / api

    @info = JSON.parse(response.body)
    # can now call response to that get request
    # binding.pry
    expect(response).to be_successful
    # checks that the connection is working
    expect(@info['data']['attributes']['latitude_and_longitude']).to eq("{:lat=>39.7392358, :lng=>-104.990251}")
    # checks that we can return desired data
  end
end
