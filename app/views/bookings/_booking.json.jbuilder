json.extract! booking, :id, :booked_seats, :user_id, :tour_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
