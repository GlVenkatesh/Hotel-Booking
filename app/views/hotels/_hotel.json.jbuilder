json.extract! hotel, :id, :name, :hotel_type, :address, :owner, :contact, :city_id, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
