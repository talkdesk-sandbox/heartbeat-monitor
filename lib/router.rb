# frozen_string_literal: true

require 'sinatra'
require_relative 'interactors/count_calls_in_progress'
require_relative 'interactors/count_calls_since'

set :bind, '0.0.0.0'
set :port, 4567
set :public_folder, File.dirname(__FILE__) + '/../public'

get '/' do
  locals = {
    in_progress: count_calls_in_progress,
    last_day: count_calls_since(datetime: DateTime.now - 1) # previous day
  }

  return erb :index, locals: locals
end
