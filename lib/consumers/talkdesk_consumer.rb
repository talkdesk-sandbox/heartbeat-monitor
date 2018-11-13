# frozen_string_literal: true

require_relative './generic_consumer.rb'
require_relative '../processors/talkdesk_processor.rb'

talkdesk_consumer = generic_consumer(
  amqp_url: ENV['TALKDESK_EVENTS_AMQP_URL'],
  exchange: 'talkdesk.events',
  processors: [TalkdeskEventProcessor.new],
  queue: 'heartbeat_calls',
  routing_keys: %w[central.calls],
)

puts 'Listening to Talkdesk events'
talkdesk_consumer.consume
# Processing occurs in the background...

Signal.trap('TERM') {
  talkdesk_consumer.close
}
