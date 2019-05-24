json.extract! ticket, :id, :description, :price, :event_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
