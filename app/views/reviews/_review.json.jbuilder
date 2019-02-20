json.extract! review, :id, :rating, :subject, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
