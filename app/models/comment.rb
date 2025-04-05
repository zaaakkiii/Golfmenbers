class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :golf_course
  validates :body, presence: true
end
