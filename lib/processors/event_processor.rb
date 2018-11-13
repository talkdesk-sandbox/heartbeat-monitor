# frozen_string_literal: true

require_relative '../interactors/flow_started.rb' # temp, we don't care about flows, we want calls.

class RoutingEventProcessor
  def on_trigger_flow(event)
    flow_started event
  end
end
