# frozen_string_literal: true

require 'bundler/setup'
require_relative 'lib/router.rb'

# Instantiate our connection to the DB:
DB = Sequel.connect(ENV['POSTGRES_URL'])
DB.loggers = Logger.new($stdout)
Sinatra::Application.set :DB, DB

run Sinatra::Application
