class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :booked_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :booked_seats, presence: true, numericality: { greater_than: 0 }, if: :both_missing?
  validates :waitlist_seats, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :waitlist_seats, presence: true, numericality: { greater_than: 0 }, if: :both_missing?
  validates :user_id, presence: true
  validates :tour_id, presence: true
  validate :seats_availability
  after_destroy :fill_available_seats


  def find_booked_tour
    Tour.find(self.tour_id)
  end

  def find_agent_id_of_tour
    find_booked_tour.user_id
  end

  def find_customer
    User.find(self.user_id)
  end

  private
    def both_missing?
      self.booked_seats = 0 if self.booked_seats.nil?
      self.waitlist_seats = 0 if self.waitlist_seats.nil?
      if self.booked_seats.zero? && self.waitlist_seats.zero?
        errors.add 'Error:', "Cannot Book unspecified number of seats for the Tour"
      end
    end

  private
    def seats_availability
      tour = find_booked_tour
      errors.add tour.name, "Cannot Book #{tour.show_status} tour" unless tour.show_status == "In Future"
      if tour.total_seats < self.booked_seats
        errors.add tour.name, "Cannot Book #{self.booked_seats} with only #{tour.total_seats} total seats in the tour."
      end
      if tour.total_seats < self.booked_seats + self.waitlist_seats
        errors.add tour.name, "Cannot Book and Wait list #{self.booked_seats + self.waitlist_seats} seats with only #{tour.total_seats} total seats in the tour."
      end
    end

  private
    def fill_available_seats
      this_tour = find_booked_tour
      filled_in = false
      if this_tour.get_waitlist > 0 && this_tour.available_seats > 0
        Booking.where("tour_id = ?", this_tour.id).find_each do |customer|
          if customer.waitlist_seats <= this_tour.available_seats
            taken_seats = customer.booked_seats
            customer.update_attributes(booked_seats: taken_seats + customer.waitlist_seats, waitlist_seats: 0)
            filled_in = true
            break
          end
        end
        unless filled_in
          Booking.where("tour_id = ?", this_tour.id).find_each do |customer|
            difference = customer.waitlist_seats - this_tour.available_seats
            taken_seats = customer.booked_seats
            customer.update_attributes(booked_seats: taken_seats + this_tour.available_seats)
            customer.update_attributes(waitlist_seats: difference)
            break
          end
        end
      end
    end
end
