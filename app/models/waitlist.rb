class Waitlist < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :requested_seats, numericality: { only_integer: true }, presence: true
end
