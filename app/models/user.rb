class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable #, :recoverable 
  
  validates :name, presence: true, length: { maximum: 30 }
  
  has_many :golf_courses, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_golf_courses, through: :favorites, source: :golf_course
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

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
