require 'rails_helper'

RSpec.describe 'api consumption', type: :feature do
  it 'consumes googles geocoding api to retrieve the latittude/longitude for a city' do
    visit('/search')

    # expect(page).to have_content('')
  end
end
