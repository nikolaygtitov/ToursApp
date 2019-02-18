class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :booked_seats, numericality: { only_integer: true }, presence: true

  def find_booked_tour
    Tour.find(self.tour_id)
  end

  def find_agent_id_of_tour
    find_booked_tour.user_id
  end

  def find_customer
    User.find(self.user_id)
  end
end
