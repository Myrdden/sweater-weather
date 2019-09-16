ENV['SINATRA_ACTIVESUPPORT_WARNING'] = 'false'
ENV['RACK_ENV'] ||= 'development'
ENV['SINATRA_ENV'] ||= 'development'

require './secrets.rb'
ENV['GOOGLE_API_KEY'] = SECRET_GOOGLE_KEY
ENV['DARKSKY_API_KEY'] = SECRET_DARKSKY_KEY

require 'bundler/setup'
require 'sinatra/base'
Bundler.require :default, ENV['SINATRA_ENV']

require_all 'app'
