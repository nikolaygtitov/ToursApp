class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  validates :name, :description, :deadline, :start_date, :end_date,
            :start_location, :country, :state, presence: true
  validates :total_seats, numericality: { only_integer: true, greater_than: 0 }, presence: true
  validates :price, numericality: true, presence: true
  validates :user_id, presence: true
  validate :start_date_after_deadline?
  validate :end_date_after_start_date?

  has_attached_file :image, styles: { large:"600x600>", medium:"300x300>", thumb:"150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :start_date, "Start date cannot be later End date"
    end
  end

  def start_date_after_deadline?
    if start_date < deadline
      errors.add :deadline, "Booking deadline date cannot be later Start date"
    end
  end

  def is_completed?
    self.end_date < Date.current
  end

  def show_agent_info
    user = User.find(self.user_id)
    "Name: #{user.name} Email: #{user.email}"
  end

  def show_status
    return "Canceled" if self.canceled
    return "Completed" if is_completed?
    return "On Going" if self.start_date <= Date.current && self.end_date >= Date.current
    "In Future"
  end

  def tour_requested_seats
    req_seats = 0
    Booking.where("tour_id = ?", self.id).find_each do |tour|
      req_seats += tour.booked_seats
    end
    req_seats
  end

  def available_seats
    self.total_seats - tour_requested_seats
  end

  def find_booking(current_user_id)
    Booking.find_by(user_id: current_user_id, tour_id: self.id)
  end

  def is_booked?(current_user_id)
    booking = find_booking(current_user_id)
    return false if booking.nil? || booking.booked_seats == 0
    true
  end

  def get_waitlist
    total_wait_seats = 0
    Booking.where("tour_id = ?", self.id).find_each do |wait_seats|
      total_wait_seats += wait_seats.waitlist_seats
    end
    total_wait_seats
  end

  def is_taken?(current_user_id)
    booking = find_booking(current_user_id)
    return false if booking.nil? || booking.booked_seats == 0
    true
  end

  def get_customer_review(current_user_id)
    Review.find_by(user_id: current_user_id, tour_id: self.id)
  end

  def get_review_id
    review = Review.find_by(tour_id: self.id)
    return nil if review.nil?
    review.id
  end

  def is_bookmarked?(current_user_id)
    booking = find_booking(current_user_id)
    booking.bookmark
  end

end
