# frozen_string_literal: true

require_relative './generic_consumer.rb'
require_relative '../processors/routing_processor.rb'

routing_consumer = generic_consumer(
  amqp_url: ENV['ROUTING_EVENTS_AMQP_URL'],
  exchange: 'routing.events',
  processors: [RoutingEventProcessor.new],
  queue: 'heartbeat_calls',
  routing_keys: %w[*.functions.* *.flows],
)

puts 'Listening to Routing events'
routing_consumer.consume
# Processing occurs in the background...

Signal.trap('TERM') {
  routing_consumer.close
}
