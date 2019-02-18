json.extract! waitlist, :id, :requested_seats, :user_id, :tour_id, :created_at, :updated_at
json.url waitlist_url(waitlist, format: :json)
