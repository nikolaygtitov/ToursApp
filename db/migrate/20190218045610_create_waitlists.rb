class CreateWaitlists < ActiveRecord::Migration[5.2]
  def change
    create_table :waitlists do |t|
      t.integer :requested_seats
      t.references :user, foreign_key: true
      t.references :tour, foreign_key: true

      t.timestamps
    end
  end
end
