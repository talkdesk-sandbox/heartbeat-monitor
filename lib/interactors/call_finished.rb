# frozen_string_literal: true

require 'logger'
require_relative '../repositories/calls.rb'

def call_finished(event)
  logger = Logger.new($stdout)
  logger.info("Call finished: #{event}")

  calls = Calls.new
  calls.insert_with_transaction(
    event['interaction_id'],
    event['call_id'],
    Calls::FINISHED,
  )
end
