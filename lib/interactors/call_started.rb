# frozen_string_literal: true

def call_started(event)
  puts "Call started at #{event['timestamp']}"
end
