class Booking < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :start_date, :end_date, :number_of_guests, presence: true
  validates :number_of_guests, numericality: { only_integer: true }
end
