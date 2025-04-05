class GolfCourse < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
end
# t.string "name"
# t.text "caption"
# t.text "body"
# t.string "address"

#↓はあとで
# t.float "latitude"
# t.float "longitude"
# t.integer "star"
