class User < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  mount_uploader :avatar, AvatarUploader
  
  has_many :tweets, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  validates :password, presence: true, length: {minimum: 6 }, allow_nil: true
  validates_confirmation_of :password
	validates :email, presence: true
	validates :first_name, :last_name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false }
  
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
  
  def self.search(search)
    if search
      where("LOWER(first_name) LIKE ? or LOWER(last_name) LIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
