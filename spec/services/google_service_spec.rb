require 'spec_helper'

RSpec.describe GoogleService do
  it 'Geocoding' do
    location = GoogleService.geocode('denver,co')

    expect(location[:lat]).to eq(39.7392358)
    expect(location[:lng]).to eq(-104.990251)

    response_file = File.expand_path '../../responses/geocode_denver.json', __FILE__
    File.open(response_file, 'w') do |file|
      file << location.to_json
    end
  end
end
