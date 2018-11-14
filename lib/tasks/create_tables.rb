# frozen_string_literal: true

require 'sequel'
require 'logger'

DB = Sequel.connect(ENV['POSTGRES_URL'])
DB.loggers << Logger.new($stdout)

def create_table
  raise 'Not done yet'
end
