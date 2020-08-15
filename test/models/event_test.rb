require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #

  test 'it converts the event object to a hash, and formats the dates to strings, adding wday, day, and weekNumber to the event hash' do
    event = events(:one)

    hashed_event = event.with_formatted_dates
    result_date = "#{event.begins_at.month}/#{event.begins_at.day}"

    assert hashed_event[:begins_at] == result_date
    assert !hashed_event[:day].nil?
  end
end
