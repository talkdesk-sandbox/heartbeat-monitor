# frozen_string_literal: true

require 'sinatra'

set :bind, '0.0.0.0'
set :port, 4567
set :public_folder, File.dirname(__FILE__) + '/../public'

get '/' do
  return erb :index, locals: {name: params['name']}
end
