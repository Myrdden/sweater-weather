require 'spec_helper'

RSpec.describe 'Base Requests' do
  def app; BaseController end

  it 'api/v1/forecast' do
    get 'api/v1/forecast', 'location' => 'denver,co'

    data = JSON.parse(last_response.body)
    binding.pry
    expected_keys = ['lat', 'long', 'currently', 'hourly', 'daily']
    expect(data[:data][:attributes][0].keys).to eq(expected_keys)
  end

  it 'api/v1/background' do
    get 'api/v1/background', 'location' => 'denver,co'

    data = JSON.parse(last_response.body)
    expect(data[:data][:attributes][0].keys).to eq(['url'])
  end

  it 'api/v1/road_trip' do
    User.destroy_all
    user = {
      'email' => 'test@user.com',
      'password' => 'password',
      'password_confirmation' => 'password'
    }
    post 'api/v1/users', user.to_json, 'CONTENT_TYPE' => 'application/json'
    key = last_response.body
    data = {
      'origin' => 'denver,co',
      'destination' => 'pueblo,co',
      'api_key' => ''
    }
    get 'api/v1/road_trip', data.to_json, 'CONTENT_TYPE' => 'application/json'
  end
end
