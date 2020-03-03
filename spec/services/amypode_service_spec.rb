require 'rails_helper'

RSpec.describe 'amypode api consumption' do
  it 'does the thing' do

    amypode_response = File.read('spec/fixtures/amypode_response.json')
    stub_request(:get, "https://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82#{ENV["amypode_api"]}").
    to_return(status: 200, body: amypode_response)

    service = AmypodeService.new("lat=27&long=-82")

    expect(service.opposite_coordinates).to eq("-27.0,98.0")
  end
end
