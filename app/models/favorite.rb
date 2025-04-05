class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :golf_course
end
