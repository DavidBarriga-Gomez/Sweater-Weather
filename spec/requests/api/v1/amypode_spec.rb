require 'rails_helper'

RSpec.describe 'gives data' do
  it 'uses structure to return data' do

    get "/api/v1/antipode?location=Hong Kong"
    @info = JSON.parse(response.body)

    expect(response).to be_successful

    expec(@info['data']).to eq('something')

  end
end
