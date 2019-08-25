class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :booking_status, foreign_key: true
      t.references :user, foreign_key: true
      t.references :driver, foreign_key: true
      t.references :vehicle, foreign_key: true
      t.integer :no_of_passenger
      t.string :pickup_location
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6

      t.timestamps
    end
  end
end
