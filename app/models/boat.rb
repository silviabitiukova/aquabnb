class Boat < ApplicationRecord
  OPT = ['Sailing boat', 'Yacht', 'Catamaran', 'Paddle dream']
  belongs_to :user
  has_one_attached :photo
  has_many :bookings
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :name, :length, :description, :port_location, :year, :passenger_capacity, presence: true
  validates :boat_type, presence: true, inclusion: { in: OPT}

  include PgSearch::Model
  pg_search_scope :search_by_port_location,
    against: [ :port_location ],
    using: {
      tsearch: { prefix: true } # <-- segments of text accepted
    }
end
