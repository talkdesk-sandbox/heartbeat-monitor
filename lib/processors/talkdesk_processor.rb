# frozen_string_literal: true

require_relative '../interactors/call_started.rb'
require_relative '../interactors/call_finished.rb'

class TalkdeskEventProcessor
  def on_call_initiated(event)
    call_started event
  end

  def on_call_finished(event)
    call_finished event
  end
end
