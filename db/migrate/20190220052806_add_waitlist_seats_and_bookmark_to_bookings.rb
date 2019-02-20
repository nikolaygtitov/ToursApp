class AddWaitlistSeatsAndBookmarkToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :waitlist_seats, :integer, default: 0
    add_column :bookings, :bookmark, :boolean
    change_column_default :bookings, :booked_seats, 0
  end
end
