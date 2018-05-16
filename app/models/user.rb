class User < ApplicationRecord
  has_secure_password
  has_many :tweets, dependent: :destroy
  before_save { email.downcase! }
  
  validates :password, presence: true, length: {minimum: 6 }, allow_nil: true
  validates_confirmation_of :password
	validates :email, presence: true
	validates :first_name, :last_name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false }
end
