require 'rails_helper'

RSpec.describe 'gives data' do
  xit 'uses structure to return data' do

    get "/api/v1/antipode?location=Hong Kong"
    @info = JSON.parse(response.body)

    expect(response).to be_successful

    expect(@info['data']).to eq('something')
  end
end
