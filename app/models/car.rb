class Car < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :bookings
end
