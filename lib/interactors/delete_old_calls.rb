# frozen_string_literal: true

require 'logger'
require_relative '../repositories/calls.rb'

def delete_old_calls(days)
  logger = Logger.new($stdout)
  logger.info("Deleting calls older than #{days} days.")

  calls = Calls.new
  calls.delete_old_calls(days: days)
end