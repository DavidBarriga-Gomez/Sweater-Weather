require 'rails_helper'

RSpec.describe 'User can', type: :feature do
  it 'retrieve wheather for a city' do
    visit("/api/v1/forecast")


    expect(page).to have_content('denver')
    # expect(service.city).to eq('denver')
    # expect(service.state).to eq('colorado')
  end
end
