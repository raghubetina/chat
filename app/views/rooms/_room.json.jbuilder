json.extract! room, :id, :name, :open_to_public, :created_at, :updated_at
json.url room_url(room, format: :json)
