
require 'logger'
require_relative '../../lib/interactors/delete_old_calls'

logger = Logger.new($stdout)

days = Integer ARGV.first


logger.info("Preparing to delete calls older than #{days} days.")

deleted = delete_old_calls days

logger.info("Deleted #{deleted} calls.")
