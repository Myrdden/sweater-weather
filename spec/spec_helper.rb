ENV['SINATRA_ENV'] = 'test'

require 'sweater_weather'

RSpec.configure do |c|
  c.include Rack::Test::Methods
end
