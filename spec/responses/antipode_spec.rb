require 'spec_helper'

RSpec.describe 'api/v1/antipode' do
  def app; AntipodeController end

  it 'works' do
    get '/api/v1/antipode', loc: 'hongkong'

    expect(last_response).to be_ok
    parsed = JSON.parse(last_response.body, symbolize_names: true)
    expect(parsed[:data][0][:attributes][:location_name]).to eq('Yavi Department')
  end
end
