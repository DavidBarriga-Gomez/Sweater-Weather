require 'rails_helper'

RSpec.describe 'api consumption', type: :feature do
  it 'consumes googles geocoding api to retrieve the latittude/longitude for a city' do
    # WebMock.disable!
    # google_response = File.read('spec/fixtures/google_response.json')
    # stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=denver,co&key=AIzaSyCFSolOM7Xc7EMazBudkM4EjpVZJEg_zZ8").
    # to_return(status: 200, body: "google_response")
    # #
    # get '/api/v1/forecast?location=denver,co'
    #  visit('/search')
     # expect(page).to have_content('')
  end
end
