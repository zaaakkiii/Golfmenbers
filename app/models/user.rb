class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable #, :recoverable 
  
  validates :name, presence: true, length: { maximum: 30 }
  
  has_many :golf_courses, dependent: :destroy
  has_many :reviwes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_golf_courses, through: :favorites, source: :golf_course
  has_many :comments, dependent: :destroy

  def favorite(golf_course)
    self.favorites.find_or_create_by(golf_course: golf_course)
  end

  def unfavorite(golf_course)
    self.favorites.find_by(golf_course: golf_course)&.destroy
  end

  def favorite?(golf_courese)
    self.favorite_golf_courses.include?(golf_courese)
  end

  def self.guest
    user = self.find_or_initialize_by(email: "guest@test.com")
    user.assign_attributes(
    password: SecureRandom.hex(6),
    name: "ゲスト"
    )
    user.save
    user
   end
end
