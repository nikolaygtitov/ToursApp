class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  validates :user_id, presence: true
  validates :tour_id, presence: true
  validates :rating, inclusion: 1..10, presence: true
  validates :subject, length: { maximum: 20 }, presence: true
  validates :content, length: { maximum: 1000 }, presence: true

  def get_customer_name
    User.find(self.user_id).name
  end

  def get_customer_email
    User.find(self.user_id).email
  end

  def find_booked_tour
    Tour.find(self.tour_id)
  end

  def get_tour_agent_id
    find_booked_tour.user_id
  end

end
