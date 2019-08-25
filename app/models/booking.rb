class Booking < ApplicationRecord
  belongs_to :booking_status
  belongs_to :user
  belongs_to :driver
  belongs_to :vehicle
  has_one :drop_location
  DEFAULT_DISTANCE = 5
  attr_accessor :start_address, :end_address
end
