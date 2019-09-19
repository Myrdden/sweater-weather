require 'spec_helper'

RSpec.describe 'User CRUD' do
  def app; UsersController end

  it 'create' do
    User.destroy_all
    data = {
      "email" => "test@email.com",
      "password" => "password",
      "password_confirmation" => "password"
    }
    post 'api/v1/users', data.to_json, "CONTENT_TYPE" => "application/json"

    expect(User.pluck[0][2]).to_not eq(nil)
  end

  it 'login' do
    User.destroy_all
    data = {
      "email" => "test@email.com",
      "password" => "password",
      "password_confirmation" => "password"
    }
    post 'api/v1/users', data.to_json, "CONTENT_TYPE" => "application/json"

    login_data = {
      "email" => "test@email.com",
      "password" => "password"
    }
    post 'api/v1/sessions', login_data.to_json, "CONTENT_TYPE" => "application/json"

    key = User.find_by(email: 'test@email.com').api_key
    reply = JSON.parse(last_response.body)
    expect(reply).to eq(key)
  end
end
