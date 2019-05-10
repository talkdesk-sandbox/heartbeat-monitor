# frozen_string_literal: true

require 'logger'
require_relative '../repositories/calls'

def count_calls_in_progress()
  logger = Logger.new($stdout)
  logger.info("Getting number of current calls")

  calls = Calls.new
  calls.count_calls_where(state: Calls::STARTED)
end