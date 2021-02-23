class Boat < ApplicationRecord
  has_one :user
  has_many :users, through: :bookings
end
