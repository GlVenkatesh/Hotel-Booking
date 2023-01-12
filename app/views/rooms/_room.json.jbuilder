json.extract! room, :id, :no, :room_type, :description, :price, :hotel_id, :created_at, :updated_at
json.url room_url(room, format: :json)
