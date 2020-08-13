require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { begins_at: @event.begins_at, datetime: @event.datetime, ends_at: @event.ends_at, name: @event.name } }
    end

    assert_redirected_to event_url(Event.last)
  end
end
