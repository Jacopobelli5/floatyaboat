class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :bookings, dependent: :destroy
  has_many :boats, dependent: :destroy

  # validations
  validates :name, presence: true
end
