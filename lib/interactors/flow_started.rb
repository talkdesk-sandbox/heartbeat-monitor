# frozen_string_literal: true

def flow_started(event)
  puts "Flow started at #{event['timestamp']}"
end
