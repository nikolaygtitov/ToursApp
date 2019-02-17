class CreateTours < ActiveRecord::Migration[5.2]
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.attachment :image
      t.date :deadline
      t.date :start_date
      t.date :end_date
      t.string :start_location
      t.text :country
      t.text :state
      t.integer :total_seats
      t.boolean :canceled, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
