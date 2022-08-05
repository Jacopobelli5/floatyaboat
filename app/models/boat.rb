class Boat < ApplicationRecord
  # associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # validations
  validates :name, :address, :price, :boat_type, presence: true
  validates :description, presence: true, length: { minimum: 160 }
end
