class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :booked_seats
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
