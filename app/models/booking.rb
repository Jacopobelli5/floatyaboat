class Booking < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :boat

  # validations
  validates :start_date, :end_date, presence: true
end
