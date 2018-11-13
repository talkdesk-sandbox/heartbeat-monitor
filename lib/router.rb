# frozen_string_literal: true

require 'sinatra'
require_relative './repositories/postgres.rb'

set :bind, '0.0.0.0'
set :port, 4567
set :public_folder, File.dirname(__FILE__) + '/../public'

get '/' do
  return erb :index, locals: {name: params['name']}
end

get '/testdb' do
  db = Postgres.new
  res = db.test_db_connection(params['value'])

  return erb :index, locals: {response: res, name: params['value']}
end
