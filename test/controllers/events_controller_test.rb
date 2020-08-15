require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get index' do
    get events_url
    assert_response :success
  end

  test 'should create event and return response of success' do
    assert_difference('Event.count') do
      post '/events.json', params: {
        event: {
          begins_at: @event.begins_at,
          ends_at: @event.ends_at,
          name: @event.name,
          location: @event.location,
          users: @event.location
        }
      }
    end

    assert_response :created
  end
end
