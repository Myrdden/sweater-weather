ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'
ENV['RACK_ENV'] ||= 'development'
ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra/base'
Bundler.require :default, ENV['SINATRA_ENV']

require_all 'app'
