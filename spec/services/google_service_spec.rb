require 'rails_helper'

RSpec.describe 'google_goecoding', type: :feature do
  service = GoogleService.new('denver,co')

  # expect(service.city).to eq("Denver, CO, USA")
end
