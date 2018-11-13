# frozen_string_literal: true

require 'talkdesk_events'
require_relative '../processors/event_processor.rb'

def generic_consumer(config)
  processors = config[:processors]
  event_dispatcher = TalkdeskEvents::Consumer::ProcessorEventDispatcher.new(processors: processors)

  consumer = TalkdeskEvents::Consumer::EventConsumer.new(
    amqp_url: config[:amqp_url],
    block: true, # doesn't block the calling thread. default is true
    event_dispatcher: event_dispatcher,
    exchange: config[:exchange], # default is 'talkdesk.events'
    priority: 10, # Consumer Priority, default is 0
    queue: config[:queue],
    routing_keys: config[:routing_keys],
    threads: 1, # default is 1
  )

  consumer
end
