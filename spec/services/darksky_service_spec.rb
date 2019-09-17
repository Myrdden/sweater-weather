require 'spec_helper'

RSpec.describe DarkskyService do
  it 'Forecasting' do
    response_file = File.expand_path '../../responses/geocode_denver.json', __FILE__
    response = JSON.parse(File.read(response_file), symbolize_names: true)
    if response[:lat] && response[:lng]
      location = response
    else
      location = GoogleService.geocode('denver,co')
      File.write(response_file, location.to_json)
    end

    expected_keys = [:latitude, :longitude, :timezone, :currently, :minutely, :hourly, :daily, :flags, :offset]
    forecast = DarkskyService.get_forecast(location)
    expect(forecast.keys).to eq(expected_keys)

    forecast_file = File.expand_path '../../responses/forcast_denver.json', __FILE__
    File.write(forecast_file, forecast.to_json)
  end
end
