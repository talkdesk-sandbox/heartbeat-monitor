# frozen_string_literal: true

require_relative '../interactors/call_started.rb'

class TalkdeskEventProcessor
  def on_call_initiated(event)
    call_started event
  end
end
