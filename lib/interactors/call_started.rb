# frozen_string_literal: true

require 'logger'
require_relative '../repositories/calls.rb'

def call_started(event)
  logger = Logger.new($stdout)
  logger.info("Call or flow started: #{event}")

  calls = Calls.new
  calls.insert_or_update(
    event['interaction_id'],
    event['call_id'],
    Calls::STARTED,
  )
end
