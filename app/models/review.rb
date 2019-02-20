class Review < ApplicationRecord
	belongs_to :user
	belongs_to :tour
	validates :user_id, :presence => true
    validates :tour_id, :presence => true
    validates :rating, :subject, :content, presence: true
end
