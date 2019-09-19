ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'
ENV['RACK_ENV'] ||= 'development'

if ENV['RACK_ENV'] == 'development' || ENV['RACK_ENV'] == 'test'
  require './secrets.rb'
  SECRETS.each do |k,v|
    ENV[k] ||= v
  end
end

require 'bundler/setup'
require 'sinatra/base'
require 'sinatra/activerecord'
Bundler.require :default, ENV['RACK_ENV']

require_all 'app'
