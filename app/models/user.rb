class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :golf_courses, dependent: :destroy
         has_many :reviwes, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 30 }
end
