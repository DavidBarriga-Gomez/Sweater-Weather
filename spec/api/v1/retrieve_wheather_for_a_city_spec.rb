require 'rails_helper'

RSpec.describe 'User can', type: :feature do
  it 'retrieve wheather for a city' do
    # visit('/forecasts')

    expect(service.city).to eq('denver')
    expect(service.state).to eq('colorado')
  end
end
