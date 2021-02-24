class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :name, :length, :description, :port_location, :year, :passenger_capacity, presence: true
  validates :boat_type, inclusion: { in: ['Sailing boat', 'Yacht', 'Catamaran', 'Paddle dream'] }
end
