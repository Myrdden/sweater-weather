ENV['RACK_ENV'] = 'test'

require File.expand_path '../../sweater_weather.rb', __FILE__

RSpec.configure do |c|
  c.include Rack::Test::Methods
end

require 'simplecov'
SimpleCov.start
