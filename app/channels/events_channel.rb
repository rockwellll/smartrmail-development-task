class EventsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "events_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
