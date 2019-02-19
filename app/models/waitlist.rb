class Waitlist < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :requested_seats, numericality: { only_integer: true }, presence: true
  validate :waitlist_seats

  def find_booked_tour
    Tour.find(self.tour_id)
  end

  def validate_booking_seats(book_seats)
    tour = find_booked_tour
    if tour.total_seats < book_seats
      return "Cannot Book #{book_seats} seats with only #{tour.total_seats} total seats in the tour."
    end
    if tour.total_seats < book_seats + self.requested_seats
      return "Cannot Book and Wait list #{book_seats + self.requested_seats} seats with only #{tour.total_seats} total seats in the tour."
    end
    nil
  end

  private
    def waitlist_seats
      tour = find_booked_tour
      errors.add tour.name, "Cannot Book #{tour.show_status} tour" unless tour.show_status == "In Future"
      if tour.total_seats < self.requested_seats
        errors.add tour.name, "Cannot Wait list #{self.requested_seats} seats with only #{tour.total_seats} total seats in the tour."
      end
    end
end
