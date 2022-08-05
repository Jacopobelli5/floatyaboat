class Review < ApplicationRecord
  belongs_to :boat
  belongs_to :user
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
