class Event < ApplicationRecord
  def self.between(start_date= Time::now.to_date, end_date = Time::now.to_date)
    where('begins_at < ? AND ends_at > ? ', start_date, end_date)
  end
end
