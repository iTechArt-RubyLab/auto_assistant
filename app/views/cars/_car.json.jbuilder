json.extract! car, :id, :make, :model, :year, :fuel_type, :engine_size, :transmission, :body_type, :mileage, :notes, :user_id, :service_id, :created_at, :updated_at
json.url car_url(car, format: :json)
