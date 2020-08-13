json.extract! event, :id, :name, :begins_at, :ends_at, :datetime, :created_at, :updated_at
json.url event_url(event, format: :json)
