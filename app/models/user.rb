class User < ApplicationRecord
  has_many :tours
  has_many :bookings
  has_many :waitlists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :agent, :customer]

  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/,
                              message: "Email format is invalid" },
            uniqueness: { case_sensitive: false }, presence: true
end
