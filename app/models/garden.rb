class Garden < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :location, uniqueness: true, presence: true
  validates :price, presence: true
  validates :capacity, presence: true

  belongs_to :user
  has_many_attached :photos
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_many :bookings
  has_many :reviews, through: :bookings
end


