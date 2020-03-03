require 'rails_helper'

RSpec.describe 'amypode api consumption' do
  it 'does the thing' do
    service = AmypodeService.new("lat=27&long=-82")

    # expect(service.opposite_coordiantes).to eq('something')
    expect(service.connection).to eq('something')
  end
end
