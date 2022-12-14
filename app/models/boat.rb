class Boat < ApplicationRecord
  # associations
  has_many_attached :photos
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validations
  validates :name, :address, :price, :boat_type, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  #geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    if reviews.size.positive?
      reviews.average(:rating)
    else
      'No ratings yet'
    end
  end
end
