class Tour < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :description, :deadline, :start_date, :end_date,
            :start_location, :country, :state, presence: true
  validates :total_seats, numericality: { only_integer: true }, presence: true
  validates :price, numericality: true, presence: true
  validate :start_date_after_deadline?
  validate :end_date_after_start_date?

  has_attached_file :image, styles: { large:"600x600>", medium:"300x300>", thumb:"150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def end_date_after_start_date?
    if end_date < start_date
      errors.add "Start date cannot be later End date"
    end
  end

  def start_date_after_deadline?
    if start_date < deadline
      errors.add "Booking deadline date cannot be later Start date"
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

  def requested_seats
    req_seats = 0
    Booking.where("tour_id = ?", self.id).find_each do |booking|
      req_seats += booking.booked_seats
    end
    req_seats
  end

  def available_seats
    self.total_seats - requested_seats
  end

  def find_booking(current_user_id)
    Booking.find_by(user_id: current_user_id, tour_id: self.id)
  end

  def is_booked?(current_user_id)
    return false if find_booking(current_user_id).nil?
    true
  end

end
