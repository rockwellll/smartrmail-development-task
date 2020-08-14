class Event < ApplicationRecord
  def self.between(start_date= Time::now.to_date, end_date = Time::now.to_date)
    where('begins_at < ? AND ends_at > ? ', start_date, end_date)
  end

  def with_formatted_dates
    {
      name: name,
      description: description,
      begins_at: "#{begins_at.month }/ #{begins_at.day}",
      ends_at: "#{ends_at.month }/ #{ends_at.day}",
      id: id
    }
  end
end
