class Review < ApplicationRecord
	belongs_to :user
	belongs_to :tour
	validates :user_id, :presence => true
    validates :tour_id, :presence => true
    validates :rating, :inclusion => 1..10, presence: true
    validates :subject, length: { maximum: 20 } , presence: true
    validates :content, length: { maximum: 1000 } , presence: true

end
