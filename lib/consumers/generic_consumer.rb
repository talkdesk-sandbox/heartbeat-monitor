# frozen_string_literal: true

require 'talkdesk_events'

def generic_consumer(config)
  processors = config[:processors]
  event_dispatcher = TalkdeskEvents::Consumer::ProcessorEventDispatcher.new(processors: processors)

  consumer = TalkdeskEvents::Consumer::EventConsumer.new(
    amqp_url: config[:amqp_url],
    block: true,
    event_dispatcher: event_dispatcher,
    exchange: config[:exchange],
    priority: 1,
    queue: config[:queue],
    routing_keys: config[:routing_keys],
    threads: 1,
  )

  consumer
end
