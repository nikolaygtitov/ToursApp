json.extract! tour, :id, :name, :description, :price, :image, :deadline, :start_date, :end_date, :start_location, :country, :state, :total_seats, :canceled, :user_id, :created_at, :updated_at
json.url tour_url(tour, format: :json)
