# frozen_string_literal: true

require 'logger'
require_relative '../repositories/calls'

def count_calls_since(datetime:)
  logger = Logger.new($stdout)
  logger.info("Getting number of current calls")

  calls = Calls.new
  calls.count_calls_where { created_at > datetime }
end