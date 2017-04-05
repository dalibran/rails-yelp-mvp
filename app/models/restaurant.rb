class Restaurant < ApplicationRecord
  RESTAURANTS = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, :address, presence: true
  validates :category, inclusion: { in: RESTAURANTS,
    message: "%{value} is not a valid category." }
end
