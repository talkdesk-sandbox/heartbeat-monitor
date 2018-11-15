# frozen_string_literal: true

require 'logger'

def call_started(event)
  logger = Logger.new($stdout)
  logger.info("Call or flow started: #{event}")
end
