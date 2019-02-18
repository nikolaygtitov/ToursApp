class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  validates :booked_seats, numericality: { only_integer: true }, presence: true

  validate :availability?

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

  def availability?
    this_tour = find_booked_tour
    errors.add "Cannot Book #{this_tour.show_status} tour" unless this_tour.show_status == "In Future"
    if this_tour.available_seats < self.booked_seats
      errors.add "Cannot Book tour due to seats availability"
    end
  end

  private
    def fill_available_seats
      this_tour = find_booked_tour
      if this_tour.get_waitlist > 0 && this_tour.available_seats > 0
        filled_in = false
        Waitlist.where("tour_id = ?", this_tour.id).find_each do |entry|
          if entry.requested_seats <= this_tour.available_seats
            booking = Booking.find_by(user_id: entry.user_id, tour_id: entry.tour_id)
            if booking.nil?
              new_book = Booking.new(user_id: entry.user_id, tour_id: entry.tour_id, booked_seats: entry.requested_seats)
              new_book.save
            else
              booking.update_attributes(booked_seats: entry.requested_seats)
            end
            filled_in = true
            entry.destroy
            break
          end
        end
        unless filled_in
          Waitlist.where("tour_id = ?", this_tour.id).find_each do |entry|
            booking = Booking.find_by(user_id: entry.user_id, tour_id: entry.tour_id)
            difference = entry.requested_seats - this_tour.available_seats
            if booking.nil?
              new_book = Booking.new(user_id: entry.user_id, tour_id: entry.tour_id, booked_seats: this_tour.available_seats)
              new_book.save
            else
              booking.update_attributes(booked_seats: difference)
            end
            entry.update_attributes(requested_seats: difference)
            break
          end
        end
      end
    end
end
