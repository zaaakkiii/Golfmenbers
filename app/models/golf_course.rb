class GolfCourse < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
end
# t.string "name"
# t.text "caption"
# t.text "body"
# t.string "address"

#↓はあとで
# t.float "latitude"
# t.float "longitude"
# t.integer "star"
